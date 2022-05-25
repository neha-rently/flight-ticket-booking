Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  # use_doorkeeper
  namespace :api do
    # get 'flights/index'
    # get 'flights/show'
    # post 'flights/create'
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
  resources :passengers
  resources :tickets
  resources :flights
end
