Rails.application.routes.draw do
  
  # get 'groups/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/profile'

  # devise_for :users
   get 'landings/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
    root 'landings#index'

    get "dashboard/check_password", to: "users#check_password", as: 'check_password'
    get "edit_profile", to: "users#account", as: 'user_account', :format => false
    post "build_profile_update", to: "users#update_profile", as: 'update_profile', :format => false
    get 'profile', to: 'users#profile', as: 'user_profile', :format => false
    get 'profile2', to: 'users#profile2', as: 'user_profile2', :format => false
    get 'status', to: 'users#status', as: 'user_status', :format => false
    get 'my_page', to: 'users#my_page', as: 'user_page', :format => false
    get 'dashboard', to: 'users#dashboard', as: 'user_dashboard', :format => false
    get 'new_member', to: 'users#build_profile', as: 'build_profile', :format => false
    get 'search', to: 'groups#search_member', as: 'search_member', :format => false
    post 'landings/request_demo', to: 'landings#request_demo'
    post 'landings/subscribe', to: 'landings#subscribe'
    get '.well-known/acme-challenge/:id', to: 'landings#confirm'

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
  # this is assigning device controllers for user(s)
  devise_for :users, controllers: {invitations: 'users/invitations', registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]

  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  resources :groups do
    resources :members do
      get "single", to: "members#show_member", as: "show_member"
    end



  end
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
  # giving more customizations to devise
   devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    get "signout" => "users/sessions#destroy",     as: :destroy_user_session
    put    "update_notification"  => "users#update_notification"

    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end




end
