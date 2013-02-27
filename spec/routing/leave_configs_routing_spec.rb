require "spec_helper"

describe LeaveConfigsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/leave_configs" }.should route_to(:controller => "leave_configs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/leave_configs/new" }.should route_to(:controller => "leave_configs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/leave_configs/1" }.should route_to(:controller => "leave_configs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/leave_configs/1/edit" }.should route_to(:controller => "leave_configs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/leave_configs" }.should route_to(:controller => "leave_configs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/leave_configs/1" }.should route_to(:controller => "leave_configs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/leave_configs/1" }.should route_to(:controller => "leave_configs", :action => "destroy", :id => "1")
    end

  end
end
