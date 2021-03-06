RecipeApp::Application.routes.draw do
  

  get '/rate' => 'ratings#create' 
  #post '/rate' => 'rater#create', :as => 'rate'
  resources :comments

  resources :coments
  resources :favorites, only: [:update, :destroy]
  resources :featured_recipes

  devise_for :users
  post 'ingredients/update' => 'ingredients#update'#, as: :edit_ingredients
  get 'ingredients/edit' => 'ingredients#edit'
  resources :recipes do
    resources :comments
    resources :directions
    # member do
    #   put :favorite
    # end
  end
  
  resources :ingredients

  get 'cart/add/:id' => 'shopping_lists#add', as: :add_to_cart
  get 'cart/add_all' => 'shopping_lists#add_all', as: :add_all_to_cart
  get 'shopping_lists'=> 'shopping_lists#index', as: :shopping_lists
  put 'shopping_lists/clear(/:id)'=> 'shopping_lists#remove', as: :remove_all_from_cart
  put 'shopping_lists/delete'=> 'shopping_lists#remove', as: :remove_from_cart
  get 'shopping_lists/download_pdf'=>'shopping_lists#download_pdf', as: :download_pdf
  get 'shopping_lists/email_pdf'=>'shopping_lists#email_pdf', as: :email_pdf



  root :to => "page#index"
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
