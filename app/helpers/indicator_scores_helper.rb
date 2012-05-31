module IndicatorScoresHelper
    
#Creates the instances in the IndicatorScores Model
#to be filled by the users
    def fill_indicator_score
        indicators = Indicator.all
        dates = ScoreDate.all
        indicators.each{|ind|
            dates.each{|da|
                IndicatorScore.new(:indicator_id => ind.id, :scoredate_id => da.id, :score => rand(100)).save
            }
        }
    end
end
