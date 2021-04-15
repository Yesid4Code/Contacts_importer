Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  resources :contacts
  resources :csv_imports do
    collection { post :import }
  end
  resources :invalid_records, only: [:index]
  root 'home#index'
end
