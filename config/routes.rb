Rails.application.routes.draw do
  resources :users, except: [:destroy, :show]
  resources :addresses
  root 'users#index'
end
