Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  # get '/login' =>  'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'

resources :pages do
  member do
    put '/like' => 'pages#like'
    get '/dislike' => 'pages#dislike'
    get '/undislike' => 'pages#undislike'
    put '/unlike' => 'pages#unlike'
  end
end


    resources :reviews


  resources :restaurants do

    resources :reviews
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
