Rails.application.routes.draw do
  resources :gamers do
    member do
      get :friends, :blocks
    end
  end

  resources :friendships,       only: [:create, :destroy]
  resources :requests, only: [:create, :destroy]
  resources :blocks, only: [:create, :destroy]
  resources :gamers, only: [:index, :show, :update, :edit]
  resources :gamers do
    resources :comments
  end

  resources :platforms, only: [:show, :edit, :update]
  resources :games do
    resources :desires, only: [:create, :update, :destroy]
  end
  resources :titles, only: [:index, :show, :edit, :update]
  resources :queries, only: [:index, :show, :new, :create]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
