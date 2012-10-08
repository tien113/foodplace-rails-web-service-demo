Foodplace::Application.routes.draw do
  
  match '/',        to: 'sessions#new'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  root :to => 'sessions#new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :foods
  resources :places
  resources :orders
  resources :order_details, only: [:show]

end
