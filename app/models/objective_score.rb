class ObjectiveScore < ActiveRecord::Base
  attr_accessible :date_id, :objective_id, :score, :scoredate_id

  belongs_to :objective
end
