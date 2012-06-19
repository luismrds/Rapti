require "spec_helper"

describe RawDataController do
  describe "routing" do

    it "routes to #index" do
      get("/raw_data").should route_to("raw_data#index")
    end

    it "routes to #new" do
      get("/raw_data/new").should route_to("raw_data#new")
    end

    it "routes to #show" do
      get("/raw_data/1").should route_to("raw_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/raw_data/1/edit").should route_to("raw_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/raw_data").should route_to("raw_data#create")
    end

    it "routes to #update" do
      put("/raw_data/1").should route_to("raw_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/raw_data/1").should route_to("raw_data#destroy", :id => "1")
    end

  end
end
