require "spec_helper"

describe ObjectivesController do
  describe "routing" do

    it "routes to #index" do
      get("/objectives").should route_to("objectives#index")
    end

    it "routes to #new" do
      get("/objectives/new").should route_to("objectives#new")
    end

    it "routes to #show" do
      get("/objectives/1").should route_to("objectives#show", :id => "1")
    end

    it "routes to #edit" do
      get("/objectives/1/edit").should route_to("objectives#edit", :id => "1")
    end

    it "routes to #create" do
      post("/objectives").should route_to("objectives#create")
    end

    it "routes to #update" do
      put("/objectives/1").should route_to("objectives#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/objectives/1").should route_to("objectives#destroy", :id => "1")
    end

  end
end
