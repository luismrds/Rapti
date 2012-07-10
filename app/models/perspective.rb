class Perspective < ActiveRecord::Base
  attr_accessible :name, :score, :weight, :redfrom, :redto, :yellowfrom, :yellowto, :greenfrom, :greento

  has_many :objectives
  
end
