# == Schema Information
#
# Table name: perspective_scores
#
#  id             :integer          not null, primary key
#  perspective_id :integer
#  scoredate_id   :integer
#  score          :float
#  redfrom        :float
#  redto          :float
#  yellowfrom     :float
#  yellowto       :float
#  greenfrom      :float
#  greento        :float
#  goal           :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe PerspectiveScore do
  pending "add some examples to (or delete) #{__FILE__}"
end
