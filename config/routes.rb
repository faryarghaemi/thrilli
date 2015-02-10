Rails.application.routes.draw do
  root :to => 'adventures#index'
  resources :users
  
  # delete '/adventures/:id/delete' => 'adventures#destroy', :as => 'delete_adventure'

  resources :adventures do 
    resources :bookings 
  end 


  get '/adventures/:adventure_id/bookings/:booking_id/users/:id' => 'bookings#user', :as => 'bookings_user'

  get '/pending' => 'bookings#pending'
  get '/confirmed' => 'bookings#confirmed'
  get '/cancellations' => 'bookings#cancellations'
  get '/bookings' => 'bookings#bookings'
  get '/yes' => 'bookings#yes'
  get '/no/:booking_id' => 'bookings#no', :as => 'no'

  get '/adventure/mine' => 'adventures#mine', :as => 'adventures_mine'


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
