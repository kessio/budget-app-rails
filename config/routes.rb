Rails.application.routes.draw do
resources :categories, controller: 'groups', as: 'groups'  do
    resources :transactions, controller: 'expenses', as: 'expenses'
  end
 
  devise_for :users

  devise_scope :users do
    authenticated :users do
      root 'groups#index', as: :authenticated_user
    end
    unauthenticated do
      root 'home#index', as: :unauthenticated_user
    end
  end
  root 'groups#index'
end
