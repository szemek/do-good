Rails.application.routes.draw do
  root 'landing#show'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => redirect('/')

  get '/login' => 'facebook#login'
  delete '/logout' => 'sessions#destroy'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    resources :deeds, only: [:index, :create, :show] do
      collection do
        get :count
      end
      member do
        post :like
        post :unlike
        post :report
      end
    end

    resources :hooks, only: [] do
      collection do
        post :email
      end
    end
  end

  resources :deeds, only: [:show]
end
