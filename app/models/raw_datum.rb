class RawDatum < ActiveRecord::Base
  attr_accessible :name, :operation_id, :default_value

  has_many :raw_data_score

    def value(dateid)
        rawscore = RawDataScore.find_by_rawdata_id_and_scoredate_id(self.id, dateid)
        return rawscore.value
    end
end
