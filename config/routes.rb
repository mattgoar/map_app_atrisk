Rails.application.routes.draw do

  #Devise default route
  root to: "client_informations#index"

  # Routes for the User_role resource:
  # CREATE
  get "/user_roles/new", :controller => "user_roles", :action => "new"
  post "/create_user_role", :controller => "user_roles", :action => "create"

  # READ
  get "/user_roles", :controller => "user_roles", :action => "index"
  get "/user_roles/:id", :controller => "user_roles", :action => "show"

  # UPDATE
  get "/user_roles/:id/edit", :controller => "user_roles", :action => "edit"
  post "/update_user_role/:id", :controller => "user_roles", :action => "update"

  # DELETE
  get "/delete_user_role/:id", :controller => "user_roles", :action => "destroy"
  #------------------------------

  # Routes for the Payment_status resource:
  # CREATE
  get "/payment_statuses/new", :controller => "payment_statuses", :action => "new"
  post "/create_payment_status", :controller => "payment_statuses", :action => "create"

  # READ
  get "/payment_statuses", :controller => "payment_statuses", :action => "index"
  get "/payment_statuses/:id", :controller => "payment_statuses", :action => "show"

  # UPDATE
  get "/payment_statuses/:id/edit", :controller => "payment_statuses", :action => "edit"
  post "/update_payment_status/:id", :controller => "payment_statuses", :action => "update"

  # DELETE
  get "/delete_payment_status/:id", :controller => "payment_statuses", :action => "destroy"
  #------------------------------

  # Routes for the Sales_rep resource:
  # CREATE
  get "/sales_reps/new", :controller => "sales_reps", :action => "new"
  post "/create_sales_rep", :controller => "sales_reps", :action => "create"

  # READ
  get "/sales_reps", :controller => "sales_reps", :action => "index"
  get "/sales_reps/:id", :controller => "sales_reps", :action => "show"

  # UPDATE
  get "/sales_reps/:id/edit", :controller => "sales_reps", :action => "edit"
  post "/update_sales_rep/:id", :controller => "sales_reps", :action => "update"

  # DELETE
  get "/delete_sales_rep/:id", :controller => "sales_reps", :action => "destroy"
  #------------------------------

  # Routes for the Client_onboarding_status resource:
  # CREATE
  get "/client_onboarding_statuses/new", :controller => "client_onboarding_statuses", :action => "new"
  post "/create_client_onboarding_status", :controller => "client_onboarding_statuses", :action => "create"

  # READ
  get "/client_onboarding_statuses", :controller => "client_onboarding_statuses", :action => "index"
  get "/client_onboarding_statuses/:id", :controller => "client_onboarding_statuses", :action => "show"

  # UPDATE
  get "/client_onboarding_statuses/:id/edit", :controller => "client_onboarding_statuses", :action => "edit"
  post "/update_client_onboarding_status/:id", :controller => "client_onboarding_statuses", :action => "update"

  # DELETE
  get "/delete_client_onboarding_status/:id", :controller => "client_onboarding_statuses", :action => "destroy"
  #------------------------------

  # Routes for the Data_status resource:
  # CREATE
  get "/data_statuses/new", :controller => "data_statuses", :action => "new"
  post "/create_data_status", :controller => "data_statuses", :action => "create"

  # READ
  get "/data_statuses", :controller => "data_statuses", :action => "index"
  get "/data_statuses/:id", :controller => "data_statuses", :action => "show"

  # UPDATE
  get "/data_statuses/:id/edit", :controller => "data_statuses", :action => "edit"
  post "/update_data_status/:id", :controller => "data_statuses", :action => "update"

  # DELETE
  get "/delete_data_status/:id", :controller => "data_statuses", :action => "destroy"
  #------------------------------

  # Routes for the Client_information resource:
  # CREATE
  get "/client_informations/new", :controller => "client_informations", :action => "new"
  post "/create_client_information", :controller => "client_informations", :action => "create"

  # READ
  get "/client_informations", :controller => "client_informations", :action => "index"
  get "/client_informations/:id", :controller => "client_informations", :action => "show"

  # UPDATE
  get "/client_informations/:id/edit", :controller => "client_informations", :action => "edit"
  post "/update_client_information/:id", :controller => "client_informations", :action => "update"

  # DELETE
  get "/delete_client_information/:id", :controller => "client_informations", :action => "destroy"
  #------------------------------

  # Routes for the Impl_status resource:
  # CREATE
  get "/impl_statuses/new", :controller => "impl_statuses", :action => "new"
  post "/create_impl_status", :controller => "impl_statuses", :action => "create"

  # READ
  get "/impl_statuses", :controller => "impl_statuses", :action => "index"
  get "/impl_statuses/:id", :controller => "impl_statuses", :action => "show"

  # UPDATE
  get "/impl_statuses/:id/edit", :controller => "impl_statuses", :action => "edit"
  post "/update_impl_status/:id", :controller => "impl_statuses", :action => "update"

  # DELETE
  get "/delete_impl_status/:id", :controller => "impl_statuses", :action => "destroy"
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
  get "/delete_client/:id", :controller => "clients", :action => "destroy"
  #------------------------------

  devise_for :users
end
