class IndicatorScore < ActiveRecord::Base
  attr_accessible :indicator_id, :score, :scoredate_id, :goal, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento, :progress, :baseline, :growth

  belongs_to :indicator

  belongs_to :scoredate, :foreign_key => "scoredate_id", :class_name => "ScoreDate"

  #With this validation there will be only one indicator_score in a given scoredate
  validates :indicator_id, :uniqueness => {:scope => :scoredate_id}

  def percentage
    b = self.redfrom
    e = self.greento
    if e >= b
      size = e - b
    else 
      size = b - e
    end
    return (self.score - b)*100 / size 
  end
end
