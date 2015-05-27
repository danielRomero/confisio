Rails.application.routes.draw do
  
  root 'application#index'

  resources :users do
    get    'signup'  => 'users#new'
  end

  resources :settings
  
  resources :posts, except: [:index]

  resources :discounts, :path => 'descuentos'
  
  resources :release_suscriptions

  resources :categories, only: [] do
    member do
      get :subcategories_selector
    end
  end

  get    'control' => 'controls#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get    'contacto'   => 'pages#about', as: 'about'

  get '/blog/:category' => 'posts#index', as: 'posts_by_category', defaults: {category: 'fisioterapia'}

  # get '/mypeople/discover/:s' => 'users#discover_people', :as => 'discover_mypeople', :constraints => { :s => /(linkedin|mail|facebook|all)/ }, :defaults => {:s => 'all'}
end
