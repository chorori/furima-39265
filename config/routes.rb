Rails.application.routes.draw do
  devise_for :orders
  devise_for :addresses
  devise_for :items
  devise_for :users
  get 'items/index'
  root to: "items#index"
end
