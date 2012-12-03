# == Schema Information
#
# Table name: objective_scores
#
#  id           :integer          not null, primary key
#  objective_id :integer
#  scoredate_id :integer
#  score        :float
#  redfrom      :float
#  redto        :float
#  yellowfrom   :float
#  yellowto     :float
#  greenfrom    :float
#  greento      :float
#  progress     :float
#  baseline     :float
#  growth       :float
#  goal         :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe ObjectiveScore do
  pending "add some examples to (or delete) #{__FILE__}"
end
