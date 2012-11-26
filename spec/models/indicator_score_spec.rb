# == Schema Information
#
# Table name: indicator_scores
#
#  id           :integer          not null, primary key
#  indicator_id :integer
#  scoredate_id :integer
#  score        :float
#  goal         :float            default(0.0)
#  redfrom      :float
#  redto        :float
#  yellowfrom   :float
#  yellowto     :float
#  greenfrom    :float
#  greento      :float
#  baseline     :float
#  growth       :float
#  progress     :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe IndicatorScore do
  pending "add some examples to (or delete) #{__FILE__}"
end
