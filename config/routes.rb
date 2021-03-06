Twalk2::Application.routes.draw do
  mount Mercury::Engine => '/'
  namespace :mercury do
    resources :images
  end
  Mercury::Engine.routes
  resources :themes

  resources :presentations do
    resources :slides do
      resources :contents
    end
  end

  get '/nearby' => 'presentations#nearby'

  get '/dashboard' => 'presentations#mine'

  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  get '/go/:id/' => 'presentations#launch', :as => :presentation_launch

  get '/sessions/update_geolocation'
  
end
