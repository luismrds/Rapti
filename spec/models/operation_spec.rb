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

require 'spec_helper'

describe Operation do
  pending "add some examples to (or delete) #{__FILE__}"
end
