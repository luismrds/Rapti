class Indicator < ActiveRecord::Base
  attr_accessible :name, :objective_ids, :weight

  has_and_belongs_to_many :objectives
end
