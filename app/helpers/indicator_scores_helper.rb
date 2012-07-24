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
# It fills the indicatorScore with random data for testing and demo.
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

  def fill_all_from_default
    ind = Indicator.all
    ind.each{|i|
      fill_from_default(i.id)
    }
  end  

  def fill_from_default(indid)
    inds = IndicatorScore.find_all_by_indicator_id(indid)
    inds.each{|i|
      #i.score = rand(100)
      if !i.score
        i.score = 0
      end
      i.redfrom = i.indicator.redfrom
      i.redto = i.indicator.redto
      i.yellowfrom = i.indicator.yellowfrom 
      i.yellowto = i.indicator.yellowto 
      i.greenfrom = i.indicator.greenfrom
      i.greento = i.indicator.greento
      i.save
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

  def cut_decimals
    scores = IndicatorScore.all
    scores.each{|s|
      s.score = s.score.round(2)
      s.save
    }
  end 

  def cleanIndicatorScoresNoShow
    noshow = Indicator.find_all_by_show(FALSE)
    noshow.each{|n|
      scores = n.indicator_scores
      scores.each{|s|
        IndicatorScore.delete(s)
      }
    }
  end

  def indicatorState(ind,date)
    score = IndicatorScore.find_by_indicator_id_and_scoredate_id(ind.id,date.id).score
    #if score >= ind.redfrom && score < ind.redto
    if score >= ind.redfrom 
      return 'btn btn-danger'
    end
    if score >= ind.yellowfrom && score <= ind.yellowto
      return 'btn btn-warning'
    end
    if score > ind.greenfrom #&& score <= ind.greento
      return 'btn btn-success'
    end
  end

end
