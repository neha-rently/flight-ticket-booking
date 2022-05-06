Rails.application.routes.draw do
  root "users#new"
  get "/login" , to: "users#login"
  post "/login" , to: "users#login_user"
  get "/passenger_show" , to: "passengers#show"
  resources :passengers
  resources :users
  resources :tickets
  resources :flights
end
