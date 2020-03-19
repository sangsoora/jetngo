Rails.application.routes.draw do
  get 'bookings/show'
  get 'bookings/new'
  get 'dashboard', to: 'dashboards#show'
  devise_for :users
  root to: 'jets#index'
  resources :jets, except: :index do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
