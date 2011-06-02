require 'spec_helper'

describe Bsonrpc::Request do
  it 'encodes an RPC as BSON' do
    request = Bsonrpc::Request.new :common, :set_loglevel, 'admin', 10
    
    bson = request.to_bson
    decoded_bson = BSON.deserialize bson
    
    decoded_bson.should be_a Hash
    decoded_bson['msg'].should be_a Array
    decoded_bson['msg'].should == ["common", "set_loglevel", 'admin', 10]
  end
end