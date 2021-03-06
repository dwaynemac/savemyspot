Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'token_session' }
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :users

  resources :activities
  resources :bookings

  root to: 'activities#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
