Rails.application.routes.draw do
  resources :posts
  resources :posts
  resources :as
  resources :schools
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_scope :user do
    root "users/sessions#new"
  end

  get 'users/agreement' => 'users#agree'

  put '/update_profile' => 'users#update_profile', as: :update_profile
  put '/update_password' => 'users#update_password', as: :update_password

  get '/dashboard/home' => 'dashboard#dashboard_home', as: :dashboard_home
  get '/dashboard/admin' => 'dashboard#dashboard_admin', as: :dashboard_admin
  get '/change_user_password' => 'dashboard#change_password', as: :change_password

  get '/admin/admin_create_new_user' => 'admin#admin_create_new_user', as: :admin_create_new_user
  put '' => 'admin#admin_create_user', as: :admin_create_user
  get '/all_users' => 'admin#index', as: :all_users
  get '/admin/set_password' => 'admin#set_password', as: :set_password
  post '/admin/set_user_password' => 'admin#set_user_password', as: :set_user_password

  Rails.application.routes.draw do
  resources :schools
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
