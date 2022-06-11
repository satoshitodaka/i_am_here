Rails.application.routes.draw do
  get '/health_checks', to: 'health_checks#show'
  root to: 'samples#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
