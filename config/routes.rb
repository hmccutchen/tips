Rails.application.routes.draw do
  root 'restaurants#index'
  get 'pages/home'
  get '/login' =>  'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users

    resources :reviews


  resources :restaurants do

    resources :reviews
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
