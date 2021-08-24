Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  resources :pets do
    resources :bookings, except: [:index, :destroy]
  end
  resources :bookings, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
