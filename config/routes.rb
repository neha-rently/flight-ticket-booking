Rails.application.routes.draw do
  namespace :api do
    get 'flights/index'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root "passengers#index"
  get "passenger_show" , to: "passengers#show"
  get "/book", to: "flights#book"
  post "/index", to: "flights#index"
  resources :passengers
  resources :tickets
  resources :flights
end
