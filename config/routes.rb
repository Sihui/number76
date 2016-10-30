Rails.application.routes.draw do
  resources :tenants
  resources :rooms
  resources :receipts
  resources :records

  root 'receipts#index'

  get 'print_receipt/:id', to: 'receipts#print'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
