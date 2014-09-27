Rails.application.routes.draw do
  root 'landing#show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :deeds, only: [:create]

  namespace :api do
    resources :deeds, only: [:index]
  end
end
