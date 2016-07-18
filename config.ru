require 'bundler/setup'
require 'omniauth-facebook'
require './app.rb'

use Rack::Session::Cookie, secret: 'oauth-demo@dev.ethanify.me'

use OmniAuth::Builder do
  provider :facebook, '1058494070866020', '27e352595e6effa0db8d44870d1c03f3'
end

run Sinatra::Application