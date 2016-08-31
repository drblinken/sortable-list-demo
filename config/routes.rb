Rails.application.routes.draw do
  resources :positions
  resources :lists
  resources :items
  root to: "lists#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
