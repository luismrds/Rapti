require "spec_helper"

describe PerspectivesController do
  describe "routing" do

    it "routes to #index" do
      get("/perspectives").should route_to("perspectives#index")
    end

    it "routes to #new" do
      get("/perspectives/new").should route_to("perspectives#new")
    end

    it "routes to #show" do
      get("/perspectives/1").should route_to("perspectives#show", :id => "1")
    end

    it "routes to #edit" do
      get("/perspectives/1/edit").should route_to("perspectives#edit", :id => "1")
    end

    it "routes to #create" do
      post("/perspectives").should route_to("perspectives#create")
    end

    it "routes to #update" do
      put("/perspectives/1").should route_to("perspectives#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/perspectives/1").should route_to("perspectives#destroy", :id => "1")
    end

  end
end
