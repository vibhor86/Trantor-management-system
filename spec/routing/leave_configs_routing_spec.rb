require "spec_helper"

describe LeaveConfigsController do
  describe "routing" do

    it "routes to #index" do
      get("/leave_configs").should route_to("leave_configs#index")
    end

    it "routes to #new" do
      get("/leave_configs/new").should route_to("leave_configs#new")
    end

    it "routes to #show" do
      get("/leave_configs/1").should route_to("leave_configs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/leave_configs/1/edit").should route_to("leave_configs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/leave_configs").should route_to("leave_configs#create")
    end

    it "routes to #update" do
      put("/leave_configs/1").should route_to("leave_configs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/leave_configs/1").should route_to("leave_configs#destroy", :id => "1")
    end

  end
end
