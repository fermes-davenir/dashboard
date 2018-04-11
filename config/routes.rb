Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'application#home'

  resources :plants
  get '/dashboard/(:week)' => 'application#dashboard', as: :dashboard
  get '/calendar' => 'application#calendar'

end
