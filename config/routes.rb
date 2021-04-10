Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'contacts/index'
  resources :contacts do
    collection { post :import }
  end
  root 'home#index'
end
