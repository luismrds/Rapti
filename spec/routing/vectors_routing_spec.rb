require "spec_helper"

describe VectorsController do
  describe "routing" do

    it "routes to #index" do
      get("/vectors").should route_to("vectors#index")
    end

    it "routes to #new" do
      get("/vectors/new").should route_to("vectors#new")
    end

    it "routes to #show" do
      get("/vectors/1").should route_to("vectors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vectors/1/edit").should route_to("vectors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vectors").should route_to("vectors#create")
    end

    it "routes to #update" do
      put("/vectors/1").should route_to("vectors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vectors/1").should route_to("vectors#destroy", :id => "1")
    end

  end
end
