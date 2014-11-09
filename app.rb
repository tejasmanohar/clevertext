require 'cleverbot'
require 'twilio-ruby'
require 'bundler'

Bundler.require

configure :development do   
  set :bind, '0.0.0.0' 
  set :port, 3000
end

get '/' do
  'lol'
end

get '/receive' do
  'lololol'
  @client = Cleverbot::Client.new
  @client.write params[:Body]
  puts resp
end