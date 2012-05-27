class Perspective < ActiveRecord::Base
  attr_accessible :name, :score, :weight

  has_many :objectives
  
end
