class IndicatorScore < ActiveRecord::Base
  attr_accessible :indicator_id, :score, :scoredate_id, :goal, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento

  belongs_to :indicator

  belongs_to :scoredate, :foreign_key => "scoredate_id", :class_name => "ScoreDate"

  #With this validation there will be only one indicator_score in a given scoredate
  validates :indicator_id, :uniqueness => {:scope => :scoredate_id}
end
