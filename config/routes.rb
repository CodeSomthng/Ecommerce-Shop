# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  # Adding routes for users
  get 'users/profile', to: 'users#profile'

  resources :categories
  resources :carts
  resources :products

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
