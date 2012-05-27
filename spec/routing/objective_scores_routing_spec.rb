require "spec_helper"

describe ObjectiveScoresController do
  describe "routing" do

    it "routes to #index" do
      get("/objective_scores").should route_to("objective_scores#index")
    end

    it "routes to #new" do
      get("/objective_scores/new").should route_to("objective_scores#new")
    end

    it "routes to #show" do
      get("/objective_scores/1").should route_to("objective_scores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/objective_scores/1/edit").should route_to("objective_scores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/objective_scores").should route_to("objective_scores#create")
    end

    it "routes to #update" do
      put("/objective_scores/1").should route_to("objective_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/objective_scores/1").should route_to("objective_scores#destroy", :id => "1")
    end

  end
end
