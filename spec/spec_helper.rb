require 'rubygems'
require 'bundler/setup'

require 'bsonrpc'
require 'awesome_print'

module SpecHelper
  def anythings count
    [anything] * count
  end
end

RSpec.configure do |config|
  # some (optional) config here
end
