Rails.application.routes.draw do
  devise_for :users
  root "passengers#index"
  resources :passengers
end
