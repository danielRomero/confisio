Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  namespace :admin do
    get '/',   to: 'home#index'
    resources  :discounts
    resources  :prices
    resources  :sections, except: :show
    resources  :posts, except: :show
    resources  :carousel_images, except: :show
    resources  :free_calls, only: [:index, :delete, :update]
  end

  get 'descuentos', to: 'discounts#index', as: :discounts
  get 'precios',    to: 'prices#index',    as: :prices
  get 'contacto',   to: 'pages#contact',   as: :contact
  
  resources  :free_calls, only: :create
  
  get 'sitemap', to: 'application#sitemap', as: 'sitemap', defaults: { format: 'xml' }

  scope ':section_permalink' do
    get '/',          to: 'sections#show',   as: :section
    get 'descuentos', to: 'sections#discounts', as: :section_discounts
    get 'precios', to: 'sections#prices', as: :section_prices
    get ':permalink', to: 'posts#show',      as: :post
  end
end
