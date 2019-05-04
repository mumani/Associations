Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get    '/login',   to: 'users#signin'
  post   '/login',   to: 'users#signin'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'

  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'new/create'
  get 'new/show'
  root 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
