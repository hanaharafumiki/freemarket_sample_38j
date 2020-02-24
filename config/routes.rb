Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'

  resources :users, except: [:index]
  resources :items, onluy: [:index, :new, :show, :edit, :update, :destory]
  resources :purchases
  resources :addresses
  resources :credit_cards

end
