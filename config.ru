require 'bundler/setup'
require 'sinatra/config_file'
require 'omniauth'
require 'omniauth-facebook'
require 'omniauth-google-oauth2'
require './app.rb'

config_file './secrets.yml'

use Rack::Session::Cookie, secret: settings.cookies["secret"]

use OmniAuth::Builder do
  provider :facebook, settings.facebook["app_id"], settings.facebook["app_secret"]
  provider :google_oauth2, settings.google["client_id"], settings.google["client_secret"]
end

run Sinatra::Application