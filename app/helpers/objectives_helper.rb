module ObjectivesHelper

include ObjectiveScoresHelper

  def fill_em
    objectives = Objective.all
    objectives.each{|o|
      o.redfrom = 0
      o.redto = 25
      o.yellowfrom = 25 
      o.yellowto = 75 
      o.greenfrom =75
      o.greento = 100
      o.progress = rand(100)
      o.baseline = rand(100)
      o.growth = rand(100)
      o.save
    }
  end

  def calculateScores
    scores = self.objective_scores
    scores.each{|s|
      s.calculate
    }
  end

  def calculateAllScores
    objs = Objective.all
    objs.each{|o|
      o.calculateScores
    }
  end

  def cleanObjectivesNoShow
    noshow = Objective.find_all_by_show(FALSE)
    noshow.each{|n|
      Objective.delete(n)
    }
  end

  def objectiveOval(obj,date)
    score = ObjectiveScore.find_by_objective_id_and_scoredate_id(obj.id,date.id).score
    #if score >= obj.redfrom && score < obj.redto
    if score < obj.redto
      return 'objectiveRed'
    end
    if score >= obj.yellowfrom && score <= obj.yellowto
      return 'objectiveYellow'
    end
    if score > obj.greenfrom #&& score <= obj.greento
      return 'objectiveGreen'
    end
  end

end
