Rails.application.routes.draw do

  root 'users#index'

  resources :users do
    get "serve"   # user_serve_path, e.g. /users/1/serve
  end
end
