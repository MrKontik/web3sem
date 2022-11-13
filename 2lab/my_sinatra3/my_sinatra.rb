require 'sequel'
require 'sequel/extensions/seed'
require  'pg'
require 'json'
require 'multi_json'
require 'sinatra'
get '/' do
  # system 'rake --tasks'
  "Hi! I am api_sinatra_postgres!\n\n"
  # haml :index, :layout => :my_layout
end
%w{ controllers models routes }.each { |dir| Dir.glob("./#{ dir }/*.rb", &method(:require)) }
