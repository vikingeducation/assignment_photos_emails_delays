Rails.application.routes.draw do

  root 'users#index'

  resources :users do
    get 'serve'
  end

  #photo_serve_path, /photos/1/serve



end
