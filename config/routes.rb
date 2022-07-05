Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  # use_doorkeeper
  namespace :api do
    resources :flights
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root "passengers#index"
  get "passenger_show" , to: "passengers#show"
  get "/book", to: "flights#book"
  get "/index", to: "flights#index"
  get "/passengers/new/:id", to: "passengers#new"
  get "/passengers/create_pnr/:id", to: "passengers#create_pnr"
  get "/passengers/pnr/:pnr", to: "passengers#show_passengers_in_pnr"

  resources :passengers
  resources :tickets
  resources :flights
end
