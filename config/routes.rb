Rails.application.routes.draw do
  devise_for :users
  root to: 'jets#index'
  resources :jets, except: :index do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create] do
    resources :reviews, only: [:create]
  end
  resources :users, only: [:show]
  resources :reviews, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
