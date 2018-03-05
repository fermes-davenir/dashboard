Rails.application.routes.draw do
  resources :possibilities
  resources :plants
  devise_for :users
  root to: 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
