# == Schema Information
#
# Table name: indicators
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  acronym      :string(255)
#  weight       :float
#  objective_id :integer
#  operation_id :integer
#  redfrom      :float
#  redto        :float
#  yellowfrom   :float
#  yellowto     :float
#  greenfrom    :float
#  greento      :float
#  progress     :float
#  baseline     :float
#  growth       :float
#  unit         :string(255)
#  formula      :string(255)
#  show         :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Indicator do
  pending "add some examples to (or delete) #{__FILE__}"
end
