Rails.application.routes.draw do
  root 'landing#show'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/login' => 'facebook#login'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    resources :deeds, only: [:index, :create] do
      member do
        post :like
        post :report
      end
    end
  end
end
