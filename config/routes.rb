Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :venues, only: [:index, :show] do
    resources :bookings, except: [:destroy]
    resources :reviews, except: [:destroy]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/filters_explained', to: 'venues#filters_explained'
end
