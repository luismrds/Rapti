class Operation < ActiveRecord::Base
  attr_accessible :firstoperand, :name, :operator, :secondoperand, :firstoperand_id, :secondoperand_id

  has_one :indicator

  def firstoperand
    return RawDatum.find(self.firstoperand_id)
  end

  def secondoperand
    return RawDatum.find(self.secondoperand_id)
  end
end
