class Indicator < ActiveRecord::Base
  attr_accessible :name, :objective_id, :weight

  belongs_to :perspective
end
