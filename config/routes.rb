Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :venues only: [:index, :show] do
    resources :bookings, except: [:destroy]
  end
  resources :bookings, only: [:destroy]

end
