Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "users/authenticate", as: :authenticate
      resources :users, only: [:index]
    end
  end
end
