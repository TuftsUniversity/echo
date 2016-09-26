Rails.application.routes.draw do
  devise_for :users
  resources :whowas_searches, only: [:index, :create]

  authenticated :user do
    root to: "whowas_searches#index", as: "auth_root"
  end

  root to: redirect("/users/sign_in")
end
