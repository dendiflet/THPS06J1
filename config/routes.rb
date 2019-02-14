Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'events#index'

resources :events
resources :users, only: [:show, :edit, :update]
resources :attendances, only: [:new, :create, :index]
resources :charges


end
