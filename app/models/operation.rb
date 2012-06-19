class Operation < ActiveRecord::Base
  attr_accessible :firstoperand, :name, :operator, :secondoperand

  has_one :indicator
end
