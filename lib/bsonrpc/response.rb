module Bsonrpc
  class Response
    def initialize bson_string
      load_response bson_string
    end

    def to_ruby
      @response['result']
    end

    protected
    def load_response bson_string
      @response = BSON.deserialize bson_string
    end
  end
end
