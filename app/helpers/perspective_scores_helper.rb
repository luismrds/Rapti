module PerspectiveScoresHelper

#Creates the instances in the PerspectiveScore Model
#to be filled by the users
  def fill_perspective_score
    perspectives = Perspective.all
    dates = ScoreDate.all
    perspectives.each{|per|
      dates.each{|da|
        PerspectiveScore.new(:perspective_id => per.id, :scoredate_id => da.id, :score => rand(100), :redfrom => per.redfrom, :redto => per.redto, :yellowfrom => per.yellowfrom, :yellowto => per.yellowto, :greenfrom => per.greenfrom, :greento => per.greento).save
        }
      }
  end

  def state(obj,date)
    score = ObjectiveScore.find_by_objective_id_and_scoredate_id(obj.id,date.id).score
    #if score >= obj.redfrom && score < obj.redto
    if score < obj.redto
      return 'btn btn-danger'
    end
    if score >= obj.yellowfrom && score <= obj.yellowto
      return 'btn btn-warning'
    end
    if score > obj.greenfrom #&& score <= obj.greento
      return 'btn btn-success'
    end
  end

  def mystate(per,date)
    score = PerspectiveScore.find_by_perspective_id_and_scoredate_id(per.id,date.id).score
    #if score >= obj.redfrom && score < obj.redto
    if score < per.redto
      return 'btn btn-danger'
    end
    if score >= per.yellowfrom && score <= per.yellowto
      return 'btn btn-warning'
    end
    if score > per.greenfrom #&& score <= per.greento
      return 'btn btn-success'
    end
  end

  def calculate
    per = self.perspective
    date = self.scoredate
    objectives = per.objectives
    objs = []
    objectives.each{|o|
      objs << ObjectiveScore.find_by_objective_id_and_scoredate_id(o.id, self.scoredate_id)
    }
    value = 0 
    objs.each{|o|
      w = o.objective.weight/100
      value = value + (w * o.score)
    }
    self.score = value
    self.save
  end

end
