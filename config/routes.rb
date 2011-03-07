TweetPoll::Application.routes.draw do

	get "poll/show"

	post "poll/vote"

	post "poll/create"

	get "poll/new"

	get "poll/destroy"

	#auth routes
	 match '/auth/:provider/callback' => 'authentications#create'	 
	
	#home
	match '/home' =>  'home#home'
	
	
	devise_for :users
		resources :authentications

	
	 root :to => 'home#index'
end
