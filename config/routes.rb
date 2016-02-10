Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  get   :login,  to: 'sessions#new'
  post  :login,  to: 'sessions#create'
  get   :logout, to: 'sessions#logout'

  namespace :admin do
    get '/' => 'admins#index', as: :admin
    resources :free_calls, except: [:create]
    resources :posts, except: [:show]
    resources :discounts, except: [:show]
    resources :categories, except: [:show]
    resources :settings, only: [:edit, :update]
    resources :app_configurations, only: [:edit, :update]
    resources :users, only: [:edit, :update]
  end

  get   :contacto, to: 'application#contact', as: :contact
  get   :equipo, to: 'users#team', as: :team
  scope 'equipo' do
    get ':section_permalink/:employee_permalink', to: 'users#employee', as: :employee
  end

  resources :sections, except: [:index], param: :permalink
  resources :free_calls, only: [:create]

  scope ':permalink' do
    resources :posts, param: :post_permalink, except: :show
    scope 'precios' do
      resources :discounts, param: :discount_permalink, path: 'descuentos'
    end
    resources :categories, param: :category_permalink, path: 'categorias'
    get 'precios', to: 'sections#precios', as: :prices
    get ':category_permalink/:post_permalink', to: 'posts#show', as: :post_permalink
  end
  get 'tarifas', to: 'application#tarifas', as: :tarifas
  get 'sitemap', to: 'application#sitemap', as: 'sitemap', defaults: { format: 'xml' }

  get '404', to: 'application#error_404', as: :error_404 # renderiza public/404.html

  get ':permalink', to: 'sections#show', as: :sections_permalink

end
