Rails.application.routes.draw do
  root 'landing#show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    resources :deeds, only: [:index, :create] do
      collection do
        get :grouped
      end
    end
  end
end
