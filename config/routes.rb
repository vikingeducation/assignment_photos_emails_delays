Rails.application.routes.draw do
  root :to => 'users#show'
  resources :users do
    get 'serve'
  end
end
