Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  get   :login,  to: 'sessions#new'
  post  :login,  to: 'sessions#create'
  get   :logout, to: 'sessions#logout'

  get   :contacto, to: 'application#contact', as: :contact
  get   :equipo, to: 'application#team', as: :team

  resources :sections, except: [:index], param: :permalink
  resources :users, only: [:edit, :update]

  resources :settings, param: :permalink #### ADMIN
  resources :app_configurations, only: [:edit, :update] #### ADMIN

  scope ':permalink' do
    resources :posts, param: :post_permalink, except: :show
    resources :discounts, param: :discount_permalink, path: 'descuentos'
    resources :categories, param: :category_permalink, path: 'categorias'
    get 'precios', to: 'sections#precios', as: :prices
    get ':category_parmalink/:post_permalink', to: 'posts#show', as: :post_permalink
  end
  get '/sitemap', to: 'application#sitemap', as: 'sitemap', defaults: { format: 'xml' }
  

  get '404', to: 'application#error_404', as: :error_404 # renderiza public/404.html

  get ':permalink', to: 'sections#show', as: :sections_permalink

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
