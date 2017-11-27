Rails.application.routes.draw do
  get 'comments/show'

  get 'comments/new'

  get 'comments/edit'

  get 'comments/delete'

  resources :friends, only: [:show]

  resources :gamers, only: [:index, :show, :update, :edit]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
