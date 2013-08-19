TrantorManagementSystem::Application.routes.draw do
 
  resources :events do 
    collection do 
     get :remove_event
    end
  end
  resources :holidays
  resources :leavemanagements  do
    collection do
      get :add,:total_balance
    end
  end
  resources :leave_configs
  resources :banks
  resources   :employees do
    collection do
      get :unconfirmed_user,:csv_import,:all_employees,:history ,:render_projects
    end
  end
  resources :projects do
    collection do
     get :all_record
    end
  end
  resources :bands do
    collection do
     get :all_record
    end
  end
  resources :designations do
    collection do
     get :all_record
    end
  end
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get "document/index"
  get "document/show"
  as :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "confirmations" }

  resources :document_templates, :documents
  match 'document' => 'document#document'
  match 'document/index' =>  'document#index'
  match 'dashboard' =>  'dashboard#dashboard'
  match 'calender' => 'leavemanagements#calender'
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'dashboard#dashboard'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
end
