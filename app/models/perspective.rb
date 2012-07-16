class Perspective < ActiveRecord::Base
  attr_accessible :name, :score, :weight, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento

  has_many :objectives

  def showableObjectives
    all = self.objectives
    all.delete_if {|a| !a.show }
  end
  
end
