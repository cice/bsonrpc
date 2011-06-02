require 'spec_helper'

describe Bsonrpc::Response do
  it 'decodes an RPC answer from BSON' do
    answer = {
      :msg => 42
    }
    
    bson = BSON.serialize answer
    
    response = Bsonrpc::Response.new bson
    
    response.to_ruby.should == 42
  end
end