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

class Objective < ActiveRecord::Base
  attr_accessible :name, :perspective_id, :score, :weight, :acronym, :redfrom, :greenfrom, :yellowfrom, :greento, :row, :col

  belongs_to :perspective
  #has_and_belongs_to_many :indicators

  has_many :indicators
  has_many :objective_scores
  has_and_belongs_to_many :vectors, :join_table => "vectors_objectives", :class_name => "Vector"
  
end
