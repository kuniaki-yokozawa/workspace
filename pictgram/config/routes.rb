Rails.application.routes.draw do


  get 'comments/new'
    get 'topics/new'
    get 'sessions/new'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'pages#index'
    get 'pages/help'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get 'favorites/index'
    post '/favorites', to: 'favorites#create'
    delete '/favorites/destroy', to: 'favorites#destroy'

    resources :users
    resources :topics
    resources :comments

  end
