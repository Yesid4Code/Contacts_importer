Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'contacts/index'
  root 'home#index'
end
