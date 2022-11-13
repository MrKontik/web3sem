require 'sinatra/base'
require "sinatra/namespace"
module MyAppModule
  class App < Sinatra::Base
    register Sinatra::Namespace

    get '/' do
      'Hello My Sinatra - Easy and Wide world!'
    end


    get %r{/hello/([\w]+)} do |c|
      "Hello, #{c}!"
    end
    get '/redirect' do
      redirect to('/hello/World')
    end
    get '/say/*/to/*' do
      # соответствует /say/hello/to/world
      params['splat'].to_s  # => ["hello", "world"]
    end
    get '/download/*.*' do |path, ext|
      [path, ext] # => ["path/to/file", "xml"]
    end
    get '/jobs.?:format?' do
      # соответствует "GET /jobs", "GET /jobs.json", "GET /jobs.xml" и т.д.
      'Да, работает этот маршрут!'
    end

    get '/*' do
      "I don't know what is the #{params[:splat]}. It's what you typed."
    end

    namespace '/api/v1' do  # 2-nd stage namespace
      get "/*" do
        "I don't kno23w what is the #{params[:splat]}. It's what you typed."
      end
    end


  end
end
