require "spec_helper"

describe PerspectiveScoresController do
  describe "routing" do

    it "routes to #index" do
      get("/perspective_scores").should route_to("perspective_scores#index")
    end

    it "routes to #new" do
      get("/perspective_scores/new").should route_to("perspective_scores#new")
    end

    it "routes to #show" do
      get("/perspective_scores/1").should route_to("perspective_scores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/perspective_scores/1/edit").should route_to("perspective_scores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/perspective_scores").should route_to("perspective_scores#create")
    end

    it "routes to #update" do
      put("/perspective_scores/1").should route_to("perspective_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/perspective_scores/1").should route_to("perspective_scores#destroy", :id => "1")
    end

  end
end
