# == Schema Information
#
# Table name: objective_scores
#
#  id           :integer          not null, primary key
#  objective_id :integer
#  scoredate_id :integer
#  score        :float
#  redfrom      :float
#  redto        :float
#  yellowfrom   :float
#  yellowto     :float
#  greenfrom    :float
#  greento      :float
#  progress     :float
#  baseline     :float
#  growth       :float
#  goal         :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ObjectiveScore < ActiveRecord::Base
  attr_accessible :date_id, :objective_id, :score, :scoredate_id, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento, :progress, :baseline, :goal


  belongs_to :objective

  belongs_to :scoredate, :foreign_key => "scoredate_id", :class_name => "ScoreDate"
  #With this validation there will be only one objective_score in a given scoredate
  validates :objective_id, :uniqueness => {:scope => :scoredate_id}
end
