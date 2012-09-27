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

# Calcula todos los desempenos de un objetivo 

  def calculateScores
    scores = self.objective_scores
    scores.each{|s|
      s.calculate
    }
  end

# Calcula el desempeno de todos los objetivos 

  def calculateAllScores
    objs = Objective.all
    objs.each{|o|
      o.calculateScores
    }
  end

# Elimina los objetivos que no quieren ser mostrados 

  def cleanObjectivesNoShow
    noshow = Objective.find_all_by_show(FALSE)
    noshow.each{|n|
      Objective.delete(n)
    }
  end

# Crea el codigo necesario para introducir en un ERB de modo que se 
#   muestren el ovalo generado con CSS para un objetivo en una fecha
#   tomando en cuenta su color de acuerdo a su desempeno. 

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

# Crea el codigo necesario para introducir en un ERB de modo que se 
#   muestren el ovalo generado con el boton que provee bootstrap
#   para un objetivo en una fecha
#   tomando en cuenta su color de acuerdo a su desempeno. 

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

# Crea el codigo necesario para introducir en un ERB de modo que se 
#   muestren el ovalo como una imagen png
#   para un objetivo en una fecha
#   tomando en cuenta su color de acuerdo a su desempeno. 

  def objectiveStaticButton(obj,date)
    score = ObjectiveScore.find_by_objective_id_and_scoredate_id(obj.id,date.id).score
    #if score >= obj.redfrom && score < obj.redto
    if score < 25 #score < obj.redto
      return obj.redButton
    end
    if score >= 25 && score <= 75 #score >= obj.yellowfrom && score <= obj.yellowto
      return obj.yellowButton
    end
    if score > 75 #score > obj.greenfrom #&& score <= obj.greento
      return obj.greenButton
    end
  end
end
