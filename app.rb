require 'sinatra'
require 'sinatra/reloader'
require 'pry'

# configure sinatra
set :run, false
set :raise_errors, true

get '/login/:provider' do
  content_type 'text/html'
  send_file "views/#{params[:provider]}.html"
end

get '/auth/:provider/callback' do
  content_type 'application/json'
  
  auth_info = request.env['omniauth.auth']
  permitted_info = auth_info.select {|k, v| %w[provider uid info credentials].include?(k)}
  MultiJson.encode(permitted_info)
end