Rails.application.routes.draw do
  resources :expenses
  resources :groups
  get 'home/index'
  root to: 'home#index'
  devise_for :users

end
