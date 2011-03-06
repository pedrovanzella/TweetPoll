TweetPoll::Application.routes.draw do
	 match '/auth/:provider/callback' => 'authentications#create'  
	 devise_for :users  
	 resources :authentications  
	 root :to => 'projects#index'
end
