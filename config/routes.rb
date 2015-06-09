Rails.application.routes.draw do
  
  root 'application#index'

  resources :users do
    get    'signup'  => 'users#new'
  end

  resources :settings
  
  resources :posts, except: [:index]
  get '/blog/:category' => 'posts#index', as: 'posts_by_category', defaults: {category: 'fisioterapia'}
  
  get '/blog/:category/:permalink' => 'posts#show', as: 'posts_by_category_permalink', defaults: {category: 'fisioterapia'}

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
  get    'equipo'       => 'pages#team',  as: 'team'

  get '/sitemap', to: 'application#sitemap', as: 'sitemap', defaults: { format: 'xml' }
end