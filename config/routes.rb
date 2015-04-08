Rails.application.routes.draw do

  root to: 'welcome#index'
  get '/about' => 'welcome#about'
  
  namespace :api, default: { format: :json } do
    resources :events, only: [:create]
  end
  
  resources :applications

  devise_for :users
  
end