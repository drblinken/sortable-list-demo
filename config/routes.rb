Rails.application.routes.draw do
  resources :positions
  resources :lists
  resources :items
  get 'list/:id/reorder', to: "lists#reorder", as: "reorder_list"
  root to: "lists#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
