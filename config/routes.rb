Rails.application.routes.draw do
  root to: "welcome#index"
  get "/home", to: "tournaments#index"

  resources :tournaments do
    resources :matches do
      collection do
        post :generate
      end
    end
  end

  resources :registrations, only: [:create, :destroy]

  # Clearance user management
  resources :passwords, controller: "clearance/passwords", only: [:new, :create]
  resource :session, controller: "sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
end
