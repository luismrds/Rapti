require "spec_helper"

describe RawDataScoresController do
  describe "routing" do

    it "routes to #index" do
      get("/raw_data_scores").should route_to("raw_data_scores#index")
    end

    it "routes to #new" do
      get("/raw_data_scores/new").should route_to("raw_data_scores#new")
    end

    it "routes to #show" do
      get("/raw_data_scores/1").should route_to("raw_data_scores#show", :id => "1")
    end

    it "routes to #edit" do
      get("/raw_data_scores/1/edit").should route_to("raw_data_scores#edit", :id => "1")
    end

    it "routes to #create" do
      post("/raw_data_scores").should route_to("raw_data_scores#create")
    end

    it "routes to #update" do
      put("/raw_data_scores/1").should route_to("raw_data_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/raw_data_scores/1").should route_to("raw_data_scores#destroy", :id => "1")
    end

  end
end
