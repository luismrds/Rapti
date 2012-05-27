require "spec_helper"

describe ScoreDatesController do
  describe "routing" do

    it "routes to #index" do
      get("/score_dates").should route_to("score_dates#index")
    end

    it "routes to #new" do
      get("/score_dates/new").should route_to("score_dates#new")
    end

    it "routes to #show" do
      get("/score_dates/1").should route_to("score_dates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/score_dates/1/edit").should route_to("score_dates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/score_dates").should route_to("score_dates#create")
    end

    it "routes to #update" do
      put("/score_dates/1").should route_to("score_dates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/score_dates/1").should route_to("score_dates#destroy", :id => "1")
    end

  end
end
