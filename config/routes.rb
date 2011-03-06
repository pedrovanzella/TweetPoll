TweetPoll::Application.routes.draw do

	#auth routes
	 match '/auth/:provider/callback' => 'authentications#create'	 

	 devise_for :users	
	 
         resources :authentications

	
	 root :to => 'home#index'
end
