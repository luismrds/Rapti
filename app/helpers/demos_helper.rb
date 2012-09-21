module DemosHelper

# Creates the instances in the IndicatorScores Model
# to be filled by the users
  def create_indicator_score
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
  def fill_increasing_indicatorscores
    indicators = Indicator.all
    score = 55 + rand(20)
    indicators.each{|i|
      iscores = i.indicator_scores.order("scoredate_id ASC")
      iscores.each{|is|
        is.score = score
        is.goal = 75 
        is.redfrom = 0
        is.redto = 25
        is.yellowfrom = 25 
        is.yellowto = 75 
        is.greenfrom =75
        is.greento = 100
        is.save
        score = score + 1
      }
      score = 55 + rand(20) 
    }
  end

# Establece en todos los indicadores y para cada mes el valor 
#   por defecto para su desempeno. 

  def fill_all_from_default
    ind = Indicator.all
    ind.each{|i|
      fill_from_default(i.id)
    }
  end  

# Dado el id de un indicador, establece para todos los meses 
#   existentes el desempeno en su valor por defecto. 

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

# Crea para todos los objetivos la medicion de su desempeno en todas las fechas existentes. 

  def create_objective_score
      objectives = Objective.all
      dates = ScoreDate.all
      objectives.each{|obj|
          dates.each{|da|
              ObjectiveScore.new(:objective_id => obj.id, :scoredate_id => da.id, :score => rand(100), :redfrom => 0, :redto => 25, :yellowfrom => 25, :yellowto => 75, :greenfrom => 75, :greento => 100).save
          }
      }
  end

# Llena de manera creciente el desempeno de los objetivos empezando en un numero 
#   aleatorio menor a 60 

  def fill_increasing_objectivescores
    objectives = Objective.all
    score = rand(60)
    objectives.each{|o|
      oscores = o.objective_scores.order("scoredate_id ASC")
      oscores.each{|is|
        is.score = score
        is.goal = 75 
        is.redfrom = 0
        is.redto = 25
        is.yellowfrom = 25 
        is.yellowto = 75 
        is.greenfrom =75
        is.greento = 100
        is.save
        score = score + 1
      }
      score = 60 
    }
  end

# Llena los valores por defecto de todos los objetivos para mostrar 
#   el reloj tipico 

  def fill_objectives_for_demo
    os = Objective.all
    os.each{|o|
      o.redfrom = 0
      o.redto = 25
      o.yellowfrom = 25 
      o.yellowto = 75 
      o.greenfrom =75
      o.greento = 100
      o.save
    }
  end

  #Creates the instances in the PerspectiveScore Model
  #to be filled by the users
  def create_perspective_scores
    perspectives = Perspective.all
    dates = ScoreDate.all
    perspectives.each{|per|
      dates.each{|da|
        PerspectiveScore.new(:perspective_id => per.id, :scoredate_id => da.id, :score => rand(100), :redfrom => per.redfrom, :redto => per.redto, :yellowfrom => per.yellowfrom, :yellowto => per.yellowto, :greenfrom => per.greenfrom, :greento => per.greento).save
        }
      }
  end
end
