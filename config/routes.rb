TweetPoll::Application.routes.draw do
	match '/home' =>  'home#home'
	get '/random' => 'poll#random'
	post "poll/create"

	get "poll/new"

	match "poll/destroy/:id" => 'poll#destroy'

	#auth routes
	 match '/auth/:provider/callback' => 'authentications#create'	 
	
	#home

	get "poll/:id" => 'poll#show'

	match "poll/:id/vote" => 'poll#vote'

	
	devise_for :users
		resources :authentications

		match '/users/:id' => 'home#show'
		
	 root :to => 'home#index'
end
