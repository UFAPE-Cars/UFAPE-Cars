Rails.application.routes.draw do
  devise_for :usuarios, controllers: {
    sessions: 'usuarios/sessions'
  }

  resources :vendas
  resources :clientes
  resources :veiculos do
    get "buscar", on: :collection
  end

  resources :vendedors do
    collection do
      get 'buscar'
    end
    resources :vendas, only: [:index]
  end

  # Defines the root path route ("/")
  root "clientes#index"
end
