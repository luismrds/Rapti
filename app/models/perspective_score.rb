class PerspectiveScore < ActiveRecord::Base
  attr_accessible :date_id, :perspective_id, :score, :scoredate_id, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento

  belongs_to :perspective
end
