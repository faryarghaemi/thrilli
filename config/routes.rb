Rails.application.routes.draw do
  root :to => 'adventures#index'
  resources :users
  
  # delete '/adventures/:id/delete' => 'adventures#destroy', :as => 'delete_adventure'

  resources :adventures do 
    resources :bookings 
  end 


  get '/adventure/mine' => 'adventures#mine', :as => 'adventures_mine'
  get '/error' => 'pages#error', :as => 'pages_error'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
