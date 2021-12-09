# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  # Adding routes for users
  get 'users/profile', to: 'users#profile'

  resources :carts
  resources :categories do
    resources :products
  end
end
