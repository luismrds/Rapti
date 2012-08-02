class Objective < ActiveRecord::Base
  attr_accessible :name, :perspective_id, :score, :weight, :acronym, :redfrom, :greenfrom, :yellowfrom, :greento, :row, :col

  belongs_to :perspective
  #has_and_belongs_to_many :indicators

  has_many :indicators
  has_many :objective_scores
  has_and_belongs_to_many :vectors, :join_table => "vectors_objectives", :class_name => "Vector"
  
end
