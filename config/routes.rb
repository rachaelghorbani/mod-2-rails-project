Rails.application.routes.draw do
  root 'home#homepage'
  get '/login', to:'sessions#new', as: 'login'
  post '/login', to: 'sessions#login'
  delete '/logout/:id', to: 'sessions#logout', as: 'logout'

  get '/reserve', to:'reservations#reserve', as: 'reserve'

  resources :reservations
  resources :players
  resources :courts
  resources :reviews 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
