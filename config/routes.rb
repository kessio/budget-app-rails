Rails.application.routes.draw do
  resources :groups
  get 'home/index'
  root to: 'home#index'
  devise_for :users

end
