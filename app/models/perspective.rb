# == Schema Information
#
# Table name: perspectives
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  weight      :float
#  redfrom     :float
#  redto       :float
#  yellowfrom  :float
#  yellowto    :float
#  greenfrom   :float
#  greento     :float
#  title_image :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Perspective < ActiveRecord::Base
  attr_accessible :name, :score, :weight, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento

  has_many :objectives
  has_many :perspective_scores

  def showableObjectives
    all = self.objectives.order("row ASC, col ASC")
    all.delete_if {|a| !a.show }
  end
  
end
