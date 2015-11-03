Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  country_constraints = {
    c: /[a-z][a-z]/
  }

  # list_constraints = {
  #   n: /[0-9]/
  # }

  root 'root#index', as: "root_url"
  get "country/:c"                     => "root#country", constraints: country_constraints,  as: "list_with_country"
  get "category/:s"                    => "root#category",               as: "list_with_category"
  get "limit/:n"                        => "root#limit", as: "list_with_limit"
  get "country/:c/category/:s"         => "root#country_category",       as: "list_with_country_category"
  get "country/:c/limit/:n"             => "root#country_limit",           as: "list_with_country_limit"
  get "country/:c/category/:s/limit/:n" => "root#country_category_limit",  as: "list_with_country_category_limit"
  get "category/:s/limit/:n"            => "root#category_limit",          as: "list_with_category_limit"

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
