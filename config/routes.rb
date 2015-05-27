Rails.application.routes.draw do
  root to: 'measurements#index'

  resources :measurements, only: [:create, :index]
end
