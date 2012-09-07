module RawDataScoresHelper

# Crea las instancias de raw data que el usuario debera llenar.

  def create_raw_data_score
    datum = RawDatum.find_all_by_operation_id(nil)
    dates = ScoreDate.all
    datum.each{|datum|
      dates.each{|date|
        if datum.default_value
          RawDataScore.new(:rawdata_id => datum.id, :scoredate_id => date.id, :value => datum.default_value).save
        end
        if !datum.default_value
          RawDataScore.new(:rawdata_id => datum.id, :scoredate_id => date.id, :value => rand(100)).save
  #cambiar el RAND por un numero negativo
        end
      }
    }
  end

end
