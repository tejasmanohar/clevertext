require 'cleverbot'
require 'twilio-ruby'
require 'bundler'

Bundler.require

configure :development do   
  set :bind, '0.0.0.0' 
  set :port, 3000
end

Twilio.configure do |config|
  config.account_sid = 'AC881f1d62823ef5127e2b2a7a1afa30f1'
  config.auth_token = 'd743a50ba1688eba1cdba47a4eb63e51'
end

get '/' do
end

get '/receive' do
  array = ["Hi there", "I live in France", "No, you", "You are a liar", "Nice work", "You look good today", "Indeed", "I'm bored", "I'm hungry", "Are you my friend?"]
  @client = Twilio::REST::Client.new
  @client.messages.create(
    from: '+12084231206',
    to: params[:From],
    body: array[Random.rand(9)]
  )
end
