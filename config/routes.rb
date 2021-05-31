Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"

  resources :users do
    resource :profile, except: [:index]
  end

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments do
      resources :commentlikes, only: [:create, :destroy]
    end
  end



end
