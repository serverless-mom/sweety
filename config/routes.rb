Rails.application.routes.draw do
  get 'reading/new'

  devise_for :users
  root 'dashboard#index'
end
