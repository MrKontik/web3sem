require "sinatra"
require "sinatra/namespace"
require 'sinatra/base'
require 'sequel'
require 'sequel/extensions/seed'
# require 'sequel/plugins/serialization'

require 'pg'

require 'json'
require 'multi_json'

DB = Sequel.connect(
  adapter: :postgres,
  database: 'api_hh_development',
  host: 'localhost',
  password: '1234',
  user: 'postgres',
  max_connections: 10,
# logger: Logger.new('log/db.log')
  )
def collection_to_api(collection)
  MultiJson.dump(collection.map { |s| s.to_api })
end
%w{ controllers models routes }.each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

before do
  content_type 'application/json'
end

namespace '/blog' do
  get '/' do
    "Hi! I am api_sinatra_postgres!\n\n"
  end
end



