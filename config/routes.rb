Rails.application.routes.draw do
  
  root to: 'groups#index'

  resources :categories, controller: 'groups', as: 'groups'  do
    resources :transactions, controller: 'expenses', as: 'expenses'
  end
 
  devise_for :users

end
