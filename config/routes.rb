# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

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
