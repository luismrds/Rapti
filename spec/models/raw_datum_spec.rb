# == Schema Information
#
# Table name: raw_data
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  hint          :string(255)
#  operation_id  :integer
#  default_value :float            default(1.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe RawDatum do
  pending "add some examples to (or delete) #{__FILE__}"
end
