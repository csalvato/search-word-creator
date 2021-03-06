SearchWordCreator::Application.routes.draw do
  resources :users, except: [:index, :show, :destroy]
  resources :word_search_puzzles do
    member do
      get 'new/', :action => 'new', as: 'new_promo'
    end
  end 
  resources :sessions, only: [:new, :create, :destroy]

  match '/download/:file_name', to: 'word_search_puzzles#download', as: "download"

  match "/purchase", to: "subscriptions#new", as: "purchase", via: :get
  match "/purchase", to: "subscriptions#create", as: "purchase", via: :post
  match "/purchase", to: "subscriptions#create", as: "purchase", via: :put

  match "/ask-us-pricing", to: "static_pages#ask_us_pricing", :as => "ask_us_pricing"
  match '/faq', to: 'static_pages#faq'
  match "/contact", to: "static_pages#contact"
  match "/plans-and-pricing" => "static_pages#plans", :as => "plans"
 
  match '/print', to: 'word_search_puzzles#print'
  match '/word-search-puzzles/:category/:name', to: 'word_search_puzzles#promo_puzzle', as: "promo_puzzle"
  match '/word-search-puzzles/:category', to: 'word_search_puzzles#category', as: "category"
  match '/word-search-puzzles', to: 'word_search_puzzles#index', as: 'index'

  match "/dashboard", to: "users#dashboard"
  match '/signup', to: 'users#new'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'static_pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
