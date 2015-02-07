Rails.application.routes.draw do
  root :to => 'adventures#index'
  resources :users, :adventures

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
