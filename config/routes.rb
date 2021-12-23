# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get '/products/search', to: 'products#search'

  namespace :admin do
    get '/users_list', to: 'users#users_list'
    put '/user_banning/:id', to: 'users#ban'
    delete '/user_banning/:id', to: 'users#destroy'
  end

  resources :users, only: %i[] do
    get :profile
    resources :carts
  end

  resources :categories do
    resources :products do
      resources :comments
    end
  end

  namespace 'api', defaults: { format: :json } do
    get '/products/search', to: 'products#search'

    namespace :admin do
      get '/users_list', to: 'users#users_list'
      put '/user_banning/:id', to: 'users#ban'
      delete '/user_banning/:id', to: 'users#destroy'
    end

    resources :users, only: %i[] do
      get :profile
      resources :carts
    end

    resources :categories do
      resources :products do
        resources :comments
      end
    end
  end
end
