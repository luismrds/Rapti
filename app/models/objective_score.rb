class ObjectiveScore < ActiveRecord::Base
  attr_accessible :date_id, :objective_id, :score, :scoredate_id, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento


  belongs_to :objective

  validates :objective_id, :uniqueness => {:scope => :scoredate_id}
end
