class PerspectiveScore < ActiveRecord::Base
  attr_accessible :date_id, :perspective_id, :score, :scoredate_id

  belongs_to :perspective
end
