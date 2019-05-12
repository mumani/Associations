Rails.application.routes.draw do
  
  get    '/login',   to: 'users#signin'
  post   '/login',   to: 'users#signin'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  delete '/signout',  to: 'users#signout'

  resources :users
  resources :events
  get 'new/create'
  get 'new/show'
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
