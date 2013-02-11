require "spec_helper"

describe LeavemanagenentsController do
  describe "routing" do

    it "routes to #index" do
      get("/leavemanagenents").should route_to("leavemanagenents#index")
    end

    it "routes to #new" do
      get("/leavemanagenents/new").should route_to("leavemanagenents#new")
    end

    it "routes to #show" do
      get("/leavemanagenents/1").should route_to("leavemanagenents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/leavemanagenents/1/edit").should route_to("leavemanagenents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/leavemanagenents").should route_to("leavemanagenents#create")
    end

    it "routes to #update" do
      put("/leavemanagenents/1").should route_to("leavemanagenents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/leavemanagenents/1").should route_to("leavemanagenents#destroy", :id => "1")
    end

  end
end
