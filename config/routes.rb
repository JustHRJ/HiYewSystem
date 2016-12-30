Rails.application.routes.draw do
 
 

root 'pages#home'
resources :metals do
 resources :metal_associates
end

resources :metal_categories, except: [:destroy]
resources :projects, except: [:destroy] do
 resources :project_logs
 resources :images
end
 
get 'metals/:id/pair', to: 'metals#pair', as: 'new_metal_pair'
post 'metals/:id/pair', to: 'metals#pairing'
get 'metals/:id/pair/edit', to: 'metals#editPair', as: 'edit_metal_pair'
post 'metals/:id/pair/edit', to: 'metals#updatePair'
 
get 'search_metals', to: 'metals#search'
get 'search_advance_metals', to: 'metals#search_advance_metal'
get 'metals_advance_search', to: 'metals#advance_search'
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