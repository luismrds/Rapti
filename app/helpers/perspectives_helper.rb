module PerspectivesHelper
  include PerspectiveScoresHelper

# Calcula los desempeno de una perspectiva. 

  def calculateScores
    scores = self.perspective_scores
    scores.each{|s|
      s.calculate
    }
  end

# Calcula todos los desempenos de todas las perspectivas 

  def calculateAllScores
    per = Perspective.all
    per.each{|p|
      p.calculateScores
    }
  end

end
