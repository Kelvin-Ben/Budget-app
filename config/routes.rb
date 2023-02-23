Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  resources :categgories, only: %i[index new create edit update destroy] do
    resources :expenses, only: %i[index new create edit update destroy]
  end
end
