# == Schema Information
#
# Table name: indicator_scores
#
#  id           :integer          not null, primary key
#  indicator_id :integer
#  scoredate_id :integer
#  score        :float
#  goal         :float            default(0.0)
#  redfrom      :float
#  redto        :float
#  yellowfrom   :float
#  yellowto     :float
#  greenfrom    :float
#  greento      :float
#  baseline     :float
#  growth       :float
#  progress     :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

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
