# == Schema Information
#
# Table name: vectors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vector < ActiveRecord::Base
  attr_accessible :name, :objective_ids

  has_and_belongs_to_many :objectives

  has_and_belongs_to_many :objectives, :join_table => "vectors_objectives", :class_name => "Objective"

  def inprocess
    quantity = 0 
    self.objectives.each{|o|
      if o.perspective_id == 3
        quantity = quantity + 1
      end 
    }
    return quantity
  end

end
