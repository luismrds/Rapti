class Objective < ActiveRecord::Base
  attr_accessible :name, :perspective_id, :score, :weight

  belongs_to :perspective
  #has_and_belongs_to_many :indicators

  has_many :indicators
end
