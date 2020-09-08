Rails.application.routes.draw do
  root 'home#homepage'
  get '/login', to:'sessions#new', as: 'login'
  post '/login', to: 'sessions#login'
  resources :reservations
  resources :players
  resources :courts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end