Gem::Specification.new do |s|
  s.name        = "bsonrpc"
  s.version     = "0.0.1"
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.authors     = ["Marian Theisen"]
  s.email       = 'marian@cice-online.net'
  s.summary     = "BSON-RPC Client"
  s.homepage    = "http://github.com/cice/bsonrpc"
  s.description = "BSONRPC"

  s.files        =  Dir["**/*"] -
                    Dir["coverage/**/*"] -
                    Dir["rdoc/**/*"] -
                    Dir["doc/**/*"] -
                    Dir["sdoc/**/*"] -
                    Dir["rcov/**/*"]

  s.add_dependency 'activesupport', '>= 3.0.0'
  s.add_dependency 'bson'
  s.add_dependency 'bson_ext'
  
  s.add_development_dependency 'rspec', '>= 2.6.0'
end
