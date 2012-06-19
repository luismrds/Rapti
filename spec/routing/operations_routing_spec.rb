require "spec_helper"

describe OperationsController do
  describe "routing" do

    it "routes to #index" do
      get("/operations").should route_to("operations#index")
    end

    it "routes to #new" do
      get("/operations/new").should route_to("operations#new")
    end

    it "routes to #show" do
      get("/operations/1").should route_to("operations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/operations/1/edit").should route_to("operations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/operations").should route_to("operations#create")
    end

    it "routes to #update" do
      put("/operations/1").should route_to("operations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/operations/1").should route_to("operations#destroy", :id => "1")
    end

  end
end
