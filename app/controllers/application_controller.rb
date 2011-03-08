class ApplicationController < ActionController::Base
  protect_from_forgery
	layout 'application'
	require "twitter"


	def client	
		Twitter.configure do |config|
		  config.consumer_key = 'MQOtmTkwmCCs5fmVMXMhg'
		  config.consumer_secret = 'A2MLsH74Zqf80nXcRR1x4JyCM0T32kKppN2z5MCA'
		  config.oauth_token = current_user.token
		  config.oauth_token_secret = current_user.secret
		end
	
		@client = Twitter::Client.new
	end
end
