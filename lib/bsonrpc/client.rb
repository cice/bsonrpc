require 'socket'
require 'bson'
require 'bsonrpc/request'
require 'bsonrpc/response'

module Bsonrpc
  class Client
    def initialize configuration = {}
      @hostname = configuration[:hostname] || 'localhost'
      @port = configuration[:port] || '8078'
    end

    def call service, method_name, *args
      request = Request.new service, method_name, *args

      with_socket do
        @socket.sendmsg request_string request

        Response.new receive_msg
      end.to_ruby
    end

    protected
    def receive_msg
      length, error = receive_header

      receive_string length
    end

    def receive_header
      length = receive_string(8).to_i
      error = receive_string(1).to_i != 0

      [length, error]
    end

    def receive_string length
      buffer = ''

      until buffer.length == length
        buffer += @socket.recv(length - buffer.length)
      end

      buffer
    end

    def request_string request
      buffer = request.to_bson.to_s
      length = buffer.length.to_s.rjust 8, "0"

      length + "0" + buffer
    end

    def open_socket
      if @socket.nil? || @socket.closed?
        puts "Opening new socket"
        @socket = TCPSocket.open @hostname, @port
      end
    end

    def with_socket &block
      open_socket

      block.call
    end
  end
end
