module PerspectivesHelper
  include PerspectiveScoresHelper

  def calculateScores
    scores = self.perspective_scores
    scores.each{|s|
      s.calculate
    }
  end

  def calculateAllScores
    per = Perspective.all
    per.each{|p|
      p.calculateScores
    }
  end

end
