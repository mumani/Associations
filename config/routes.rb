Rails.application.routes.draw do
  
  get 'invitations/create'
  get 'invitations/destroy'
  get 'invitations/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'

  resources :users
  get 'event/attend', to: 'events#attend'
  resources :events
  
  get 'new/create'
  get 'new/show'
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
