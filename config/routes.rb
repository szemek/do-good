Rails.application.routes.draw do
  root 'landing#show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    resources :deeds, only: [:index, :create] do
      member do
        post :like
      end
    end
  end
end
