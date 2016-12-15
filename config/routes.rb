Rails.application.routes.draw do
  resources :users

  #photo_serve_path, /photos/1/serve
  resources :photos, only: [:show, :new, :create] do
    get "serve"
  end


end
