require "spec_helper"

describe LeavemanagementsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/leavemanagements" }.should route_to(:controller => "leavemanagements", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/leavemanagements/new" }.should route_to(:controller => "leavemanagements", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/leavemanagements/1" }.should route_to(:controller => "leavemanagements", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/leavemanagements/1/edit" }.should route_to(:controller => "leavemanagements", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/leavemanagements" }.should route_to(:controller => "leavemanagements", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/leavemanagements/1" }.should route_to(:controller => "leavemanagements", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/leavemanagements/1" }.should route_to(:controller => "leavemanagements", :action => "destroy", :id => "1")
    end

  end
end
