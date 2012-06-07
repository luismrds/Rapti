class ScoreDate < ActiveRecord::Base

  has_many :rawdatascores, :class_name => 'RawDataScore', :foreign_key => "scoredate_id"
  accepts_nested_attributes_for :rawdatascores

  has_many :indicatorscores, :class_name => 'IndicatorScore', :foreign_key => "scoredate_id"
  accepts_nested_attributes_for :indicatorscores

  attr_accessible :month, :year, :rawdatascore_attributes, :indicatorscores_attributes
end
