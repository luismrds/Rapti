module IndicatorScoresHelper
    
# Creates the instances in the IndicatorScores Model
# to be filled by the users
  def fill_indicator_score
      indicators = Indicator.all
      dates = ScoreDate.all
      indicators.each{|ind|
          dates.each{|da|
              IndicatorScore.new(:indicator_id => ind.id, :scoredate_id => da.id).save
          }
      }
  end

#FOR DEMO AND TEST'S USE ONLY
# If fills the indicatorScore with random data for testing and demo.
  def fill_em
    os = IndicatorScore.all
    os.each{|o|
      o.score = rand(100)
      o.redfrom = 0
      o.redto = 25
      o.yellowfrom = 25 
      o.yellowto = 75 
      o.greenfrom =75
      o.greento = 100
      o.progress = rand(100)
      o.baseline = rand(100)
      o.growth = rand(100)
      o.goal = rand(100)
      o.save
    }
  end

#To be used for the trend graphics, given an indicator and the current date
#it gives you the last N scores incluiding the actual. 

  def getLastNindicatorScore(n, indicator, date)
      dateObject = Date.new(date.year,date.month,1)        
      dates = []
      dates << date
      n = n-1
      n.times{
          dateObject = dateObject - 1.month
          dates << ScoreDate.find_by_month_and_year(dateObject.month,dateObject.year)
      }
      scores = []
      dates.each{|d|
          scores.unshift(IndicatorScore.find_by_indicator_id_and_scoredate_id(indicator.id, d.id))            
      }
      return scores 
  end

end
