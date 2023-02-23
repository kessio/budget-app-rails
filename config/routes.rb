Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  resources :categories, controller: 'groups', as: 'groups'  do
    resources :transactions, controller: 'expenses', as: 'expenses'
  end
 
  devise_for :users

end
