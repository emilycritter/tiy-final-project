Rails.application.routes.draw do
  root 'pieces#index'

  resources :pieces
  resources :users
  resources :artists

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  get 'sign_out' => 'sessions#delete', as: :sign_out

  get 'cart' => 'carts#view', as: :cart
  post 'cart' => 'carts#add_to_cart', as: :add_to_cart
  delete 'cart' => 'carts#remove_from_cart', as: :remove_from_cart
  post 'checkout' => 'carts#process_payment', as: :process_payment
  get 'receipt/:order_confirmation' => 'carts#receipt', as: :receipt

  namespace :api do
    resources :pieces
    resources :users
    resources :artists
    get 'me' => 'users#me'
    patch 'users/location/:id' => 'users#update_location'
    put 'users/location/:id' => 'users#update_location'
  end

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
