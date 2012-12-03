# == Schema Information
#
# Table name: raw_data_scores
#
#  id           :integer          not null, primary key
#  scoredate_id :integer
#  value        :float
#  rawdata_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe RawDataScore do
  pending "add some examples to (or delete) #{__FILE__}"
end
