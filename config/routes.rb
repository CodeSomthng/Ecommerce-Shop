# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  # Adding routes for users
  get 'users/profile', to: 'users#profile'
  get 'users/profile/edit', to: 'users#profile#edit'

  # resources :users
  resources :carts
  resources :categories do
    resources :products
  end
end
