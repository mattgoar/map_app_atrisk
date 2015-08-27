Rails.application.routes.draw do

  root to: "client_informations#index_summary"

  # Routes for the User_role resource:
  # CREATE
  # get "/user_roles/new", :controller => "user_roles", :action => "new"
  # post "/create_user_role", :controller => "user_roles", :action => "create"

  # READ
  # get "/user_roles", :controller => "user_roles", :action => "index"
  # get "/user_roles/:id", :controller => "user_roles", :action => "show"

  # UPDATE
  # get "/user_roles/:id/edit", :controller => "user_roles", :action => "edit"
  # post "/update_user_role/:id", :controller => "user_roles", :action => "update"

  # DELETE
  # get "/delete_user_role/:id", :controller => "user_roles", :action => "destroy"
  #------------------------------

  # Routes for the Payment_status resource:
  # CREATE
  get "/payment_statuses/new", :controller => "payment_statuses", :action => "new"
  post "/create_payment_status", :controller => "payment_statuses", :action => "create"
  # READ
  get "/payment_statuses", :controller => "payment_statuses", :action => "index"
  #get "/payment_statuses/:id", :controller => "payment_statuses", :action => "show"

  # UPDATE
  # get "/payment_statuses/:id/edit", :controller => "payment_statuses", :action => "edit"
  # post "/update_payment_status/:id", :controller => "payment_statuses", :action => "update"

  # DELETE
  get "/activate_payment_status/:id", :controller => "payment_statuses", :action => "activate"
  get "/deactivate_payment_status/:id", :controller => "payment_statuses", :action => "deactivate"

  #------------------------------

  # Routes for the Sales_rep resource:
  # CREATE
  get "/sales_reps/new", :controller => "sales_reps", :action => "new"
  post "/create_sales_rep", :controller => "sales_reps", :action => "create"

  # READ
  get "/sales_reps", :controller => "sales_reps", :action => "index"
  #get "/sales_reps/:id", :controller => "sales_reps", :action => "show"

  # UPDATE
  # get "/sales_reps/:id/edit", :controller => "sales_reps", :action => "edit"
  # post "/update_sales_rep/:id", :controller => "sales_reps", :action => "update"

  # DELETE
  get "/activate_sales_rep/:id", :controller => "sales_reps", :action => "activate"
  get "/deactivate_sales_rep/:id", :controller => "sales_reps", :action => "deactivate"
  #------------------------------

  # Routes for the Client_onboarding_status resource:
  # CREATE
  get "/client_onboarding_statuses/:id/new", :controller => "client_onboarding_statuses", :action => "new"
  post "/create_client_onboarding_status", :controller => "client_onboarding_statuses", :action => "create"

  # READ
  # get "/client_onboarding_statuses", :controller => "client_onboarding_statuses", :action => "index"
  get "/client_onboarding_statuses/:id", :controller => "client_onboarding_statuses", :action => "show"

  # UPDATE
  # get "/client_onboarding_statuses/:id/edit", :controller => "client_onboarding_statuses", :action => "edit"
  # post "/update_client_onboarding_status/:id", :controller => "client_onboarding_statuses", :action => "update"

  # DELETE
  # get "/delete_client_onboarding_status/:id", :controller => "client_onboarding_statuses", :action => "destroy"
  #------------------------------

  # Routes for the Data_status resource:
  # CREATE
  get "/data_statuses/new", :controller => "data_statuses", :action => "new"
  post "/create_data_status", :controller => "data_statuses", :action => "create"

  post "/import_data", :controller => "data_statuses", :action => "import_data"


  # READ
  #get "/data_statuses", :controller => "data_statuses", :action => "index"
  get "/data_statuses/:id", :controller => "data_statuses", :action => "show"

  # UPDATE
  # get "/data_statuses/:id/edit", :controller => "data_statuses", :action => "edit"
  # post "/update_data_status/:id", :controller => "data_statuses", :action => "update"

  # DELETE
  # get "/delete_data_status/:id", :controller => "data_statuses", :action => "delete"
  #------------------------------

  # Routes for the Client_information resource:
  # CREATE
  get "/client_informations/new", :controller => "client_informations", :action => "new"
  get "/client_informations/:id/new_contract", :controller => "client_informations", :action => "new_contract"
  get "/client_informations/:id/new_payment", :controller => "client_informations", :action => "new_payment"
  get "/client_informations/:id/new_contact", :controller => "client_informations", :action => "new_contact"
  post "/create_client_information", :controller => "client_informations", :action => "create"

  # READ
  get "/client_informations", :controller => "client_informations", :action => "index"
  get "/client_informations_summary", :controller => "client_informations", :action => "index_summary"
  get "/client_informations/:id/contract", :controller => "client_informations", :action => "show_contract"
  get "/client_informations/:id/payment", :controller => "client_informations", :action => "show_payment"
  get "/client_informations/:id/contact", :controller => "client_informations", :action => "show_contact"
  get "/client_informations/:id", :controller => "client_informations", :action => "show"


  # UPDATE
  # get "/client_informations/:id/edit", :controller => "client_informations", :action => "edit"
  # post "/update_client_information/:id", :controller => "client_informations", :action => "update"

  # DELETE
  # get "/delete_client_information/:id", :controller => "client_informations", :action => "destroy"
  #------------------------------

  # Routes for the Impl_status resource:
  # CREATE
  get "/impl_statuses/new", :controller => "impl_statuses", :action => "new"
  post "/create_impl_status", :controller => "impl_statuses", :action => "create"

  # READ
  get "/impl_statuses", :controller => "impl_statuses", :action => "index"
  #get "/impl_statuses/:id", :controller => "impl_statuses", :action => "show"

  # UPDATE
  # get "/impl_statuses/:id/edit", :controller => "impl_statuses", :action => "edit"
  # post "/update_impl_status/:id", :controller => "impl_statuses", :action => "update"

  # DELETE
  get "/activate_impl_status/:id", :controller => "impl_statuses", :action => "activate"
  get "/deactivate_impl_status/:id", :controller => "impl_statuses", :action => "deactivate"

  #------------------------------

  # Routes for the Client resource:
  # CREATE
  get "/clients/new", :controller => "clients", :action => "new"
  post "/create_client", :controller => "clients", :action => "create"

  # READ
  get "/clients", :controller => "clients", :action => "index"
  get "/clients/:id", :controller => "clients", :action => "show"

  # UPDATE
  get "/clients/:id/edit", :controller => "clients", :action => "edit"
  post "/update_client/:id", :controller => "clients", :action => "update"

  # DELETE
  get "/activate_client/:id", :controller => "clients", :action => "activate"
  get "/deactivate_client/:id", :controller => "clients", :action => "deactivate"

  #------------------------------

  devise_for :users
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
