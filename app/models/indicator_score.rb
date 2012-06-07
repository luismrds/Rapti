class IndicatorScore < ActiveRecord::Base
  attr_accessible :indicator_id, :score, :scoredate_id, :goal

  belongs_to :indicator

  validates :indicator_id, :uniqueness => {:scope => :scoredate_id}
end
