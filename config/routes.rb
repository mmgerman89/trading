Rails.application.routes.draw do
  resources :klines do
    collection do
      post 'process_and_save'
    end
  end
  # Custom
  get 'crypto', to: 'crypto#index'
  get 'analyze', to: 'crypto#analyze'
  

  # Base
  resources :people
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'test', to: 'clients#test'

  devise_for :users
  # Allows us to use link_to for session destroy
  devise_scope :user do
    get "/users/sign_out", as: "sign_out", to: "devise/sessions#destroy"
  end

  # Defines the root path route ("/")
  root "pages#home"
end
