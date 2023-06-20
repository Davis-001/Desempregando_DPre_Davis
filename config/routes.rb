Rails.application.routes.draw do
  resources :profiles
  resources :companies, only: [:new, :edit, :create, :update]
  resources :positions do
    resources :applicants, only: [:index]
  end
  resources :applicants, only: [:new, :create]
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
end
