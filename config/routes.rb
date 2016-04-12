Rails.application.routes.draw do
  root             'static_pages#home'
  get 'reports', to: 'static_pages#reports'
  get 'record', to: 'readings#new'
 
  devise_for :users
  resources :users
  resources :readings

end
