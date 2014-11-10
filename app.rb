require 'cleverbot'
require 'twilio-ruby'
require 'bundler'

Bundler.require

configure :development do   
  set :bind, '0.0.0.0' 
  set :port, 3000
end

Twilio.configure do |config|
  config.account_sid = ''
  config.auth_token = ''
end

get '/receive' do
  @Cclient = Cleverbot::Client.new
  @Cclient.write params[:Body]
  @client = Twilio::REST::Client.new
  @client.messages.create(
    from: '+12084231206',
    to: params[:From],
    body: @Cclient[:message]
  )
end
