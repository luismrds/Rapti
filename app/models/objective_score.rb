class ObjectiveScore < ActiveRecord::Base
  attr_accessible :date_id, :objective_id, :score, :scoredate_id, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento


  belongs_to :objective

  belongs_to :scoredate, :foreign_key => "scoredate_id", :class_name => "ScoreDate"
  #With this validation there will be only one objective_score in a given scoredate
  validates :objective_id, :uniqueness => {:scope => :scoredate_id}
end
