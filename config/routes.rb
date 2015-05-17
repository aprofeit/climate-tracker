Rails.application.routes.draw do
  resources :measurements, only: [:create, :index]
end
