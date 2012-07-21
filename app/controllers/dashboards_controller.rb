class DashboardsController < ApplicationController
  include ApplicationHelper
  include ObjectiveScoresHelper
  include PerspectiveScoresHelper
  include IndicatorScoresHelper

  def show
    @category = params[:cat]
    @type = params[:type]
    date = params[:date]
    @sc = ScoreDate.find(date)
    if @category == "perspective"
      @individual = Perspective.find(params[:id])
      @tc = " la Perspectiva: " + @individual.name + " "
      @sons = @individual.objectives
      @currentscores = []
      @sons.each{|i|
        @currentscores << ObjectiveScore.find_by_objective_id_and_scoredate_id(i.id, date)
      }
      @last6s = []
      @sons.each{|i|
        @last6s << getLastNobjectiveScore(6, i, @sc)
      }     
      myscore = PerspectiveScore.find_by_perspective_id_and_scoredate_id(@individual.id, date).score
      mylast6s = getLastNperspectiveScore(6, @individual, @sc)
    end
    if @category == "objective"
      @individual = Objective.find(params[:id])
      @tc = "l Objetivo: " + @individual.name + " "
      @sons = @individual.indicators
      @currentscores = []
      @sons.each{|i|
        @currentscores << IndicatorScore.find_by_indicator_id_and_scoredate_id(i.id, date)
      }
      @last6s = []
      @sons.each{|i|
        @last6s << getLastNindicatorScore(6, i, @sc)
      }
      @names = []
      @currentscores.each{|c|
        @names << c.indicator.name
      }
      myscore = ObjectiveScore.find_by_objective_id_and_scoredate_id(@individual.id, date).score
      mylast6s = getLastNobjectiveScore(6, @individual, @sc)
    end
    if @category == "indicator"
      @individual = Indicator.find(params[:id])
      @tc = "l Indicador: " + @individual.name + " "
      @sons = @individual.sons
      @currentscores = []
      @sons.each{|i|
        @currentscores << IndicatorScore.find_by_indicator_id_and_scoredate_id(i.id, date)
      }
      @last6s = []
      @sons.each{|i|
        @last6s << getLastNindicatorScore(6, i, @sc)
      }
      @names = []
      @currentscores.each{|c|
        @names << c.indicator.name
      }
      myscore = IndicatorScore.find_by_indicator_id_and_scoredate_id(@individual.id, date).score
      mylast6s = getLastNindicatorScore(6, @individual, @sc)
    end
    if @type == "current"
      @charts  = []
      @currentscores.each{|c|
        @charts << produceGauge("", c.score, 800, 200, c.redfrom, c.redto, c.yellowfrom, c.yellowto, c.greenfrom, c.greento, 5, 0, 100)
      }
      @mychart = produceGauge("", myscore, 800, 200, @individual.redfrom, @individual.redto, @individual.yellowfrom, @individual.yellowto, @individual.greenfrom, @individual.greento, 5, 0, 100)
    end
    if @type == "trend"
      @charts  = []
      i = 0 
      @last6s.each{|l|
        @charts << produceLineChart("Tendencia de 6 meses anteriores", l, @sons[i].name)
        i = i + 1
      }
      @mychart = produceLineChart("Tendencia de 6 meses anteriores", mylast6s, @individual.name)
    end
  end

end
