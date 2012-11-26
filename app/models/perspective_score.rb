# == Schema Information
#
# Table name: perspective_scores
#
#  id             :integer          not null, primary key
#  perspective_id :integer
#  scoredate_id   :integer
#  score          :float
#  redfrom        :float
#  redto          :float
#  yellowfrom     :float
#  yellowto       :float
#  greenfrom      :float
#  greento        :float
#  goal           :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PerspectiveScore < ActiveRecord::Base
  attr_accessible :date_id, :perspective_id, :score, :scoredate_id, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento

  belongs_to :perspective

  belongs_to :scoredate, :foreign_key => "scoredate_id", :class_name => "ScoreDate"

  #With this validation there will be only one perspective_score in a given scoredate
  validates :perspective_id, :uniqueness => {:scope => :scoredate_id}
end
