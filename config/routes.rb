Rails.application.routes.draw do
  resources :posts 
  resources :categories
  resources :users
  post '/auth/login', to: 'session#login'
end