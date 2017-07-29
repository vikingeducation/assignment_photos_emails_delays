Rails.application.routes.draw do
  resources :users do
    get 'serve'
  end
end
