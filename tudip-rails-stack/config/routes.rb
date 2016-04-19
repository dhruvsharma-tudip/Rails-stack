Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Defining the root path for the member
  authenticated   :user, ->(u) { u.roles_mask?} do
    root :to => 'home#member_dashboard', as: :member
  end

  # Defining the root path for the admin
  authenticated   :user, ->(u) { !u.roles_mask?} do
    root :to => 'home#admin_dashboard', as: :admin
  end

  # Else index page will be the dashboard for non-logged in user
  root 'home#index'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
        confirmations: 'users/confirmations',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        sessions: 'users/sessions'
    }
  end


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
