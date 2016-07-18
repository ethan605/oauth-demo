require 'sinatra'
require 'sinatra/reloader'
require 'yaml'
require 'pry'

# configure sinatra
set :run, false
set :raise_errors, true

get '/login/:provider' do
  content_type 'text/html'
  send_file 'views/facebook.html'
end

get '/auth/:provider/callback' do
  content_type 'application/json'
  MultiJson.encode(request.env['omniauth.auth'])
end