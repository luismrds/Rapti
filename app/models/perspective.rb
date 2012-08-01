class Perspective < ActiveRecord::Base
  attr_accessible :name, :score, :weight, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento

  has_many :objectives
  has_many :perspective_scores

  def showableObjectives
    all = self.objectives.order("row ASC, col ASC")
    all.delete_if {|a| !a.show }
  end
  
end
