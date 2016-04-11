Rails.application.routes.draw do


  devise_for :users
  root 'dashboard#index'
  resources :users
  resources :readings

end
