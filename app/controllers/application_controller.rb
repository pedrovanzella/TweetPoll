class ApplicationController < ActionController::Base
  protect_from_forgery
	layout 'application'
	require "twitter"


	def after_sign_in_path_for(resource_or_scope)
	  if resource_or_scope.is_a?(User)
	    :back
	  else
	    super
	  end
	end
	
	def bitly
		@bitly = Bitly.new('elland', 'R_d0eb4b962b432e3313f1b2412e98f1e0')
	end

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
