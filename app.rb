require 'cleverbot'
require 'twilio-ruby'
require 'pry' if Sinatra::Base.development?
require 'bundler'

Bundler.require

get '/' do
  'lol'
end

get '/receive' do
  'lolol'
end