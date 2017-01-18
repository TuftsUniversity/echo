Rails.application.routes.draw do
  devise_for :users
  resources :whowas_searches, only: [:index, :create]
  resources :lockouts, only: [:index] do
    collection do
      post 'search'
    end
  end

  authenticated :user do
    root to: "whowas_searches#index", as: "auth_root"
  end

  root to: redirect("/users/sign_in")
end
