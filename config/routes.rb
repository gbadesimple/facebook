Rails.application.routes.draw do

  #devise_for :users, :controllers => { :registrations => "registrations" }

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', :registrations => "registrations" }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"

  resources :users do
    resources :friend_requests, only: [:create, :update, :destroy]
    resource :profile, except: [:index]
  end

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments do
      resources :commentlikes, only: [:create, :destroy]
    end
  end


end
