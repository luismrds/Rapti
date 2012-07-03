class IndicatorScore < ActiveRecord::Base
  attr_accessible :indicator_id, :score, :scoredate_id, :goal

  belongs_to :indicator

  #With this validation there will be only one indicator_score in a given scoredate
  validates :indicator_id, :uniqueness => {:scope => :scoredate_id}
end
