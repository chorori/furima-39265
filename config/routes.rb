Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  get 'items/new', to: 'items#new', as: 'new_item'
end
