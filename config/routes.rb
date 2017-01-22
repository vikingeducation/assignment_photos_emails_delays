Rails.application.routes.draw do
  resources :users do 
    resource :photo do
      get 'serve'
    end
  end
end
