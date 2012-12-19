Tms::Application.routes.draw do
  devise_for :users
  root :to => "admin/dashboards#index"
  namespace :admin do
    resources :dashboards, :only => :index
  end
end
