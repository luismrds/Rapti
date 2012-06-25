class Vector < ActiveRecord::Base
  attr_accessible :name, :objective_ids

  has_and_belongs_to_many :objectives

  has_and_belongs_to_many :objectives, :join_table => "vectors_objectives", :class_name => "Objective"

end
