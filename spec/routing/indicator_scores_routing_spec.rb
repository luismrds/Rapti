require "spec_helper"

describe IndicatorScoresController do
  describe "routing" do

    it "routes to #index" do
      get("/indicator_scores").should route_to("indicator_scores#index")
    end

    it "routes to #new" do
      get("/indicator_scores/new").should route_to("indicator_scores#new")
    end

    it "routes to #show" do
      get("/indicator_scores/1").should route_to("indicator_scores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/indicator_scores/1/edit").should route_to("indicator_scores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/indicator_scores").should route_to("indicator_scores#create")
    end

    it "routes to #update" do
      put("/indicator_scores/1").should route_to("indicator_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/indicator_scores/1").should route_to("indicator_scores#destroy", :id => "1")
    end

  end
end
