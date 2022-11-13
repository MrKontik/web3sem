require 'sequel'
require 'sequel/extensions/seed'
require  'pg'
require 'json'
require 'multi_json'
require 'sinatra'

DB = Sequel.connect(
  adapter: :postgres,
  database: 'api_hh_development',
  host: 'localhost',
  password: '1234',
  user: 'postgres',
  max_connections: 10,
# logger: Logger.new('log/db.log')
  )

get '/' do
  # system 'rake --tasks'
  "Hi! I am api_sinatra_postgres!\n\n"
  # haml :index, :layout => :my_layout
end
%w{ controllers models routes }.each { |dir| Dir.glob("./#{ dir }/*.rb", &method(:require)) }

before do
  content_type 'application/json' # To see perfectly in POSTMAN - in tab Pretty
end

def collection_to_api(collection) # For Array
  # puts "In collection_to_api: collection = #{collection.inspect}" [:vaues]
  a = MultiJson.dump(collection.map { |s| s.to_api })# if collection.is_a?(Array)
  puts "In collection_to_api: a = #{a.inspect}"
  a
end




