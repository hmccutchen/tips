Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

resources :pages do
  member do
    put '/like' => 'pages#like'
    put '/dislike' => 'pages#dislike'
    get '/undislike' => 'pages#undislike'
    put '/unlike' => 'pages#unlike'
  end
end

  resources :users

    resources :reviews do
      resources :restaurants
    end



  resources :restaurants do
    resources :reviews
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
