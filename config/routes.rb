Rails.application.routes.draw do
  root :to => 'adventures#index'
  resources :users, :adventures, :bookings 
  delete '/adventures/:id' => 'adventures#destroy', :as => 'adventure_delete'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
