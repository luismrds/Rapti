# == Schema Information
#
# Table name: objectives
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  acronym        :string(255)
#  weight         :float
#  score          :float
#  perspective_id :integer
#  redfrom        :float
#  redto          :float
#  yellowfrom     :float
#  yellowto       :float
#  greenfrom      :float
#  greento        :float
#  progress       :float
#  baseline       :float
#  growth         :float
#  measurement    :string(255)
#  show           :boolean          default(TRUE)
#  greenButton    :string(255)
#  yellowButton   :string(255)
#  redButton      :string(255)
#  col            :integer
#  row            :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Objective do
  pending "add some examples to (or delete) #{__FILE__}"
end
