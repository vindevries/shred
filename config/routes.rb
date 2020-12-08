Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instructors

  resources :instructor_packages, only: [:new, :create] 
   resources :bookings, only: [:new, :create]
  resources :instructor_languages, only: [:new, :create]
  resources :instructor_locations, only: [:new, :create]

  get "/dashboard", to: "dashboards#dashboard", as: :dashboard

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
