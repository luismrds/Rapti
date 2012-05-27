class Objective < ActiveRecord::Base
  attr_accessible :name, :perspective_id, :score, :weight
end
