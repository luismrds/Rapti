# == Schema Information
#
# Table name: raw_data
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  hint          :string(255)
#  operation_id  :integer
#  default_value :float            default(1.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RawDatum < ActiveRecord::Base
  attr_accessible :name, :operation_id, :default_value, :hint

  has_many :raw_data_score
  belongs_to :operation

    def value(dateid)
        rawscore = RawDataScore.find_by_rawdata_id_and_scoredate_id(self.id, dateid)
        return rawscore.value
    end
end
