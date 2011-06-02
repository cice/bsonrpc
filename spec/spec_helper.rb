require 'rubygems'
require 'bundler/setup'

require 'bsonrpc'

module SpecHelper
  def anythings count
    [anything] * count
  end
end

RSpec.configure do |config|
  # some (optional) config here
end
