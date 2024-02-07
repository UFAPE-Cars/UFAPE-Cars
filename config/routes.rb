Rails.application.routes.draw do
  resources :vendas
  resources :clientes
  resources :veiculos
  resources :vendedors

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "render#index"
end
