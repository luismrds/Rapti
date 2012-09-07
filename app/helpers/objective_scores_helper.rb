module ObjectiveScoresHelper

#Creates the instances in the ObjectiveScore Model
#to be filled by the users
  def fill_objective_score
      objectives = Objective.all
      dates = ScoreDate.all
      objectives.each{|obj|
          dates.each{|da|
              ObjectiveScore.new(:objective_id => obj.id, :scoredate_id => da.id, :score => rand(100), :redfrom => obj.redfrom, :redto => obj.redto, :yellowfrom => obj.yellowfrom, :yellowto => obj.yellowto, :greenfrom => obj.greenfrom, :greento => obj.greento).save
          }
      }
  end

# Obtiene los ultimos n desempenos del objetivo dado empesando en date

  def getLastNobjectiveScore(n, objective, date)
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
          scores.unshift(ObjectiveScore.find_by_objective_id_and_scoredate_id(objective.id, d.id))            
      }
      return scores 
  end

  def objectiveState(ind,date)
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

  def fill_em
    os = ObjectiveScore.all
    os.each{|o|
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

  def indicatorscorestate(ind)
    score = ind.score
    #if score >= ind.redfrom && score < ind.redto
    if score < ind.redto
      return 'btn btn-danger'
    end
    if score >= ind.yellowfrom && score <= ind.yellowto
      return 'btn btn-warning'
    end
    if score > ind.greenfrom #&& score <= ind.greento
      return 'btn btn-success'
    end
  end

# Calcula el desempeno de todos los objectivescores existentes. 

  def calculateEveryObjectiveScore
    ps = ObjectiveScore.all
    ps.each{|p|
      p.calculate
    }
  end

# Calcula el desempeno de un objectivescore basandose en sus indicadores 

  def calculate
    obj = self.objective
    date = self.scoredate
    indicators = obj.indicators
    is = []
    indicators.each{|i|
      is << IndicatorScore.find_by_indicator_id_and_scoredate_id(i.id, self.scoredate_id)
    }
    value = 0 
    is.each{|i|
      if i.indicator.weight
        w = i.indicator.weight/100
        value = value + (w * i.percentage)
      end
    }
    self.score = value
    self.save
  end

#Deletes de ObjectiveScores of those objectives that are set to not be shown 


  def cleanObjectivesScoresNoShow
    noshow = Objective.find_all_by_show(FALSE)
    noshow.each{|n|
      scores = n.objective_scores
      scores.each{|s|
        ObjectiveScore.delete(s)
      }
    }
  end

# Elimina los decimales de todos los objectivescores y los deja en 2 decimales. 

  def cut_decimals
    scores = ObjectiveScore.all
    scores.each{|s|
      s.score = s.score.round(2)
      s.save
    }
  end 
end

















