require 'socket'
require 'bson'
require 'bsonrpc/request'
require 'bsonrpc/response'

require 'ruby-debug'

module Bsonrpc
  class Client
    def initialize configuration = {}
      @hostname = configuration[:hostname] || 'localhost'
      @port = configuration[:port] || '8073'
    end
    
    def call service, method_name, *args
      request = Request.new service, method_name, *args
      
      with_socket do |socket|
        socket.sendmsg request_string request
        
        Response.new response_string socket.recvmsg[0]
      end.to_ruby
    end
    
    protected
    def request_string request
      buffer = request.to_bson.to_s
      length = buffer.length.to_s.rjust 8, "0"
      
      length + "0" + buffer
    end
    
    def response_string buffer
      buffer[9..-1]
    end
    
    def open_socket
      if @socket.nil? || @socket.closed?
        puts "Opening new socket"
        @socket = TCPSocket.open @hostname, @port
      end
    end
    
    def with_socket &block
      open_socket
      
      block.call @socket
    end
  end
end