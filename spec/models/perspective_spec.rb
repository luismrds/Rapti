# == Schema Information
#
# Table name: perspectives
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  weight      :float
#  redfrom     :float
#  redto       :float
#  yellowfrom  :float
#  yellowto    :float
#  greenfrom   :float
#  greento     :float
#  title_image :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Perspective do
  pending "add some examples to (or delete) #{__FILE__}"
end
