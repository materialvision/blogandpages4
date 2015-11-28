Rails.application.routes.draw do

  resources :pages

  #map.bio 'bio', :controller => 'pages', :action => 'show', :id=>26
  #map.works 'works', :controller => 'pages', :action => 'show', :id=>49

  get 'bio', to: 'pages#show', id:26
  get 'works', to: 'pages#show', id:49

  get 'calculate_importance', to: 'pages#calculate_importance'

  resources :posts

  get 'tagged', to: 'posts#tagged'
  get 'rss', to: 'posts#rss'

  get 'signup', to:'users#new'
  #get 'logout', to:'sessions#destroy'
  #get 'login', to:'sessions#new'
  #resources :sessions

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out


  resources :users
  root 'posts#index'
  match ':controller/:action/:id', via: [:get, :post]
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
