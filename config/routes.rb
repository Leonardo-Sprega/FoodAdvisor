Rails.application.routes.draw do
  post 'search', to: 'search#index', as: 'search'
  post 'search/suggestions', to: 'search#suggestions', as: 'search_suggestions'

  

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/about', to: 'pages#about'
  get '/contact_us', to: 'pages#contact_us'

  resources :login
  resources :home
  resources :tipo_cucinas
  resources :utentes
  resources :likes, only: [:create, :destroy]
  resources :like_recensiones, only: [:create, :destroy]
  resources :ristorantes do
    resources :piattos
    resources :foto_ristorantes
    resources :prenotaziones
    resources :recensiones do
      resources :foto_recensiones
    end
  end

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
