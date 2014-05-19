Example::Application.routes.draw do
  root "posts#index"
  # User resources 
  resources :users, except: [:show]
  match '/users/new', to: "users#new", via: "get"
  match "/users/:id", to: "users#show", via: "get"
  # Post resources
  resources :posts
  get "/posts/reply/:id" => "posts#reply"
  # Sessions methods
  resources :sessions, only: [:new, :create, :destroy]
  resources :comments
  get "/sessions" => "sessions#index"
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/render_comments/', to: 'comments#render_comments', via: 'get'
  match '/reply/:id(.:format)', to: 'comments#reply', via: 'get'
  match '/edit/:id(.:format)', to: 'comments#edit', via: 'get'
  #groups resources
  resources :groups
  match '/groups/add', to: 'groups#add', via: 'post'
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
