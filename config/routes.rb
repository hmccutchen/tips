Rails.application.routes.draw do

root 'restaurants#index'

resources :restaurants






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
