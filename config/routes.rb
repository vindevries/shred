Rails.application.routes.draw do
  get 'instructor_languages/destroy'
  get 'instructor_locations/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :instructors

  resources :instructor_packages, only: [:index, :create, :destroy]
  resources :instructor_locations, only: [:destroy]
  resources :instructor_languages, only: [:destroy]
  resources :bookings, only: [:new, :create, :edit, :update]
  resources :bookings, only: [] do
    member do
      post :accept
      post :reject
      get :confirm_payment
    end
  end
  resources :instructor_languages, only: [:new, :create]
  resources :instructor_locations, only: [:new, :create]
  resources :bookings, only: [] do
    resources :reviews,only: [:new, :create]
    resources :payments, only: :new
  end

  get "/dashboard", to: "dashboards#dashboard", as: :dashboard

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
