require "spec_helper"

describe IndicatorsController do
  describe "routing" do

    it "routes to #index" do
      get("/indicators").should route_to("indicators#index")
    end

    it "routes to #new" do
      get("/indicators/new").should route_to("indicators#new")
    end

    it "routes to #show" do
      get("/indicators/1").should route_to("indicators#show", :id => "1")
    end

    it "routes to #edit" do
      get("/indicators/1/edit").should route_to("indicators#edit", :id => "1")
    end

    it "routes to #create" do
      post("/indicators").should route_to("indicators#create")
    end

    it "routes to #update" do
      put("/indicators/1").should route_to("indicators#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/indicators/1").should route_to("indicators#destroy", :id => "1")
    end

  end
end
