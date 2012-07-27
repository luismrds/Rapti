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

  def objectiveOval(obj,date,name)
    score = ObjectiveScore.find_by_objective_id_and_scoredate_id(obj.id,date.id).score
    #if score >= obj.redfrom && score < obj.redto
    if score <= obj.redto
      a = '<div class="objectiveRed">'+name+"</div><!--cierra nombe-->"
      return a.html_safe
    end
    if score >= obj.yellowfrom && score <= obj.yellowto
      a = '<div class="objectiveYellow">'+name+"</div><!--cierra nombe-->"
      return a.html_safe
    end
    if score >= obj.greenfrom #&& score <= obj.greento
      a = '<div class="objectiveGreen">'+name+"</div><!--cierra nombe-->"
      return a.html_safe
    end
  end

  def objectiveBootstrapOval(obj,date)
    score = ObjectiveScore.find_by_objective_id_and_scoredate_id(obj.id,date.id).score
    #if score >= obj.redfrom && score < obj.redto
    if score < obj.redto
      return 'badge badge-important'
    end
    if score >= obj.yellowfrom && score <= obj.yellowto
      return 'badge badge-warning'
    end
    if score > obj.greenfrom #&& score <= obj.greento
      return 'badge badge-success'
    end
  end

  def objectiveStaticButton(obj,date)
    score = ObjectiveScore.find_by_objective_id_and_scoredate_id(obj.id,date.id).score
    #if score >= obj.redfrom && score < obj.redto
    if score < obj.redto
      return obj.redButton
    end
    if score >= obj.yellowfrom && score <= obj.yellowto
      return obj.yellowButton
    end
    if score > obj.greenfrom #&& score <= obj.greento
      return obj.greenButton
    end
  end
end
