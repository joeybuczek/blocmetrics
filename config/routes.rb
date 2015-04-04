Rails.application.routes.draw do

  root to: 'welcome#index'
  get '/about' => 'welcome#about'
  
  resources :applications

  devise_for :users
  
end