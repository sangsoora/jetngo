Rails.application.routes.draw do
  patch 'bookings/:id/send', to: 'bookings#send', as: :send
  patch 'bookings/:id/accept', to: 'bookings#accept', as: :accept
  patch 'bookings/:id/decline', to: 'bookings#decline', as: :decline
  patch 'bookings/:id/cancel', to: 'bookings#cancel', as: :cancel
  devise_for :users
  root to: 'jets#index'
  resources :jets, except: :index do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
