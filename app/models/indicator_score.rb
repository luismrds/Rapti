class IndicatorScore < ActiveRecord::Base
  attr_accessible :indicator_id, :score, :scoredate_id

  validates :indicator_id, :uniqueness => {:scope => :scoredate_id}
end
