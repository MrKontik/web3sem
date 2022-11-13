root = File.expand_path File.dirname(__FILE__)
require File.join( root , 'my_sinatra.rb' )

run Sinatra::Application
