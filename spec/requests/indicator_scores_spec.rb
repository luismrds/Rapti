require 'spec_helper'

describe "IndicatorScores" do
  describe "GET /indicator_scores" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get indicator_scores_path
      response.status.should be(200)
    end
  end
end
