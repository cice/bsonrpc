require 'bson'

module Bsonrpc
  class Request
    def initialize service, method_name, *args
      @service, @method_name, @arguments = service.to_s, method_name.to_s, args
    end
    
    def to_bson
      BSON.serialize request
    end
    
    protected
    def request
      {
        :msg => message
      }
    end
    
    def message
      [@service, @method_name, *@arguments]
    end
  end
end