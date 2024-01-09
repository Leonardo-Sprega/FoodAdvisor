Rails.application.routes.draw do
  
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth',
                                  passwords: 'passwords/passwords', 
                                  sessions: 'passwords/sessions',
                                  registrations: 'passwords/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

 

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  root "home#index"

  post 'search', to: 'search#index', as: 'search'
  post 'search/suggestions', to: 'search#suggestions', as: 'search_suggestions'

  get '/about', to: 'pages#about'
  get '/contact_us', to: 'pages#contact_us'

  get '/filters', to: 'pages#filters'

  #routes profilo utente

  get '/dati_utente', to: 'profilo#dati_utente'
  get '/ristoranti_utente', to: 'profilo#ristoranti_utente'
  get '/recensioni_utente', to: 'profilo#recensioni_utente'
  get '/prenotazioni_utente', to: 'profilo#prenotazioni_utente'

  
  
  resources :profilo
  resources :login
  resources :home
  resources :tipo_cucinas
  resources :likes, only: [:create, :destroy]
  resources :like_recensiones, only: [:create, :destroy]
  resources :ristorantes do
    get 'order_recensione/:order_type', action: :order_recensione, on: :member
    resources :piattos
    resources :foto_ristorantes
    resources :prenotaziones do
      post 'noutente', on: :collection
    end
    resources :recensiones do
      resources :foto_recensiones
    end
  end



end
