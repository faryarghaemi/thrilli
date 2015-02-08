Rails.application.routes.draw do
  root :to => 'adventures#index'
  resources :users, :adventures, :bookings 
  delete '/adventures/:id' => 'adventures#destroy', :as => 'delete_adventure'


  post '/bookings' => 'bookings#create', :as => 'create_booking'

  get '/adventure/mine' => 'adventures#mine', :as => 'adventures_mine'
  get '/error' => 'pages#error', :as => 'pages_error'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
