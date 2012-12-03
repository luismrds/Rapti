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

class RawDataScore < ActiveRecord::Base
  attr_accessible :rawdata_id, :scoredate_id, :value

  belongs_to :rawdata, :class_name => 'RawDatum'
  belongs_to :scoredate, :class_name => 'ScoreDate'

  validates :rawdata_id, :uniqueness => {:scope => :scoredate_id}

    def operation_id
        return self.rawdata.operation_id
    end 
end
