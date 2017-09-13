Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    get '/',   to: 'home#index'
    resources  :discounts
    resources  :prices
    resources  :sections, except: :show
    resources  :posts, except: :show
    resources  :carousel_images, except: :show
    resources  :free_calls, only: [:index, :delete, :update]
    devise_for :users
  end

  get 'descuentos', to: 'discounts#index', as: :discounts
  get 'precios',    to: 'prices#index',    as: :prices
  get 'contacto',   to: 'pages#contact',   as: :contact
  
  resources  :free_calls, only: :create

  scope ':section_permalink' do
    get '/',          to: 'sections#show',   as: :section
    get 'descuentos', to: 'discounts#index', as: :section_discounts
    get ':permalink', to: 'posts#show',      as: :post
  end
end
