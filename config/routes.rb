TweetPoll::Application.routes.draw do
	match '/home' =>  'home#home'
	
	get "poll/show"

	post "poll/vote"

	post "poll/create"

	get "poll/new"

	get "poll/destroy"

	#auth routes
	 match '/auth/:provider/callback' => 'authentications#create'	 
	
	#home
	
	
	
	devise_for :users
		resources :authentications

	
	 root :to => 'home#index'
end
