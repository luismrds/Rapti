# == Schema Information
#
# Table name: operations
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  operator         :string(1)
#  firstoperand_id  :integer
#  secondoperand_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

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
