Rails.application.routes.draw do
  root "users#index"
  resources :users do
    get "serve"   # user_serve_path, e.g. /users/1/serve
    get "upload"   # user_upload_path, e.g. /users/1/upload this is for the local filesystem
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
