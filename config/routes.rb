Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#new"

  get '/users/:id/serve' => 'users#serve', as: 'photo_serve'
end
