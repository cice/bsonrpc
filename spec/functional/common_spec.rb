require 'spec_helper'

describe Bsonrpc do
  it 'can dispatch a simple rpc' do
    c = Bsonrpc::Client.new

    result = c.call :common, :get_stats
    puts result.class
    result.should be_a String
    result.should include "OpenERP server"
  end
end
