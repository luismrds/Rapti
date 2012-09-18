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

# Define el estado del desempeno de un objetivo en una fecha especifica. Entiendase por estado, 
#   en cual de los colores se encontraria el reloj. 

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

# El estado de una perspectiva en una fecha

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

# Calcula el desempeno de todas las perspectivas en todas las fechas para las 
#   cuales se ha creado un desempeno. 

  def calculateEveryPerspectiveScore
    ps = PerspectiveScore.all
    ps.each{|p|
      p.calculate
    }
  end   

# Calcula el desempeno de de una perspectivescore.

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

# Obtiene los ultimos N desempenos de una perspectiva empezando en la fecha especificada. 

  def getLastNperspectiveScore(n, perspective, date)
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
          scores.unshift(PerspectiveScore.find_by_perspective_id_and_scoredate_id(perspective.id, d.id))            
      }
      return scores 
  end

  def perspectiveLayout(perspective, date)
    lay = ""
    i = 0
    perspective.showableObjectives.each { |o|
      if i%4 == 0 
         lay = lay + '<div class="row-fluid" align = "center">'
      end
      if perspective.showableObjectives.size - i == 2 && i%4 == 0
        lay = lay + '<div class="span3" align="center"></div>'
        i = i + 1
      end
      i = i + 1
      lay = lay + '<div class="span3" align="center">'
      if o.acronym   
        a = link_to objectiveatdate_path(o.id,@date.id,6) do 
                    objectiveOval(o,date,o.acronym) 
            end 
        lay = lay + a 
      else
        a = link_to objectiveatdate_path(o.id,@date.id,6) do 
                    objectiveOval(o,date,o.name) 
            end 
        lay = lay + a 
      end
      lay = lay + "</div><!--span3-->"
      if i%4 == 0 
          lay = lay + '</div> <!--fin row--><div class="row-fluid" align = "center"><!--WhiteSpace--></br></div> '
        lay = lay + '<div class="row-fluid" align = "center">'
      end
    }
    return lay.html_safe
  end 

  def perspectiveStaticLayout(perspective, date)
    lay = ""
    i = 0
    perspective.showableObjectives.each { |o|
      if i%4 == 0 
         lay = lay + '<div class="row-fluid" align = "center">'
      end
      if perspective.showableObjectives.size - i == 2 && i%4 == 0
        lay = lay + '<div class="span3" align="center"></div>'
        i = i + 1
      end
      i = i + 1
      lay = lay + '<div class="span3" align="center">'
      if o.acronym   
        a = link_to image_tag(objectiveStaticButton(o,date), :size => "148x70"), objectiveatdate_path(o.id,@date.id,6) 
        lay = lay + a 
      else
        a = link_to objectiveatdate_path(o.id,@date.id,6) do 
                    objectiveOval(o,date,o.name) 
            end 
        lay = lay + a 
      end
      lay = lay + "</div><!--span3-->"
      if i%4 == 0 
          lay = lay + '</div> <!--fin row--><div class="row-fluid" align = "center"><!--WhiteSpace--></br></div> '
        lay = lay + '<div class="row-fluid" align = "center">'
      end
    }
    return lay.html_safe
  end 

  def perspectiveCoordinatesLayout(perspective, date)
    lay = ""
    rowcounter = 1
    rows = []
    actr = []
    perspective.showableObjectives.each { |o|          
      if o.row == rowcounter
        actr << o
        if o == perspective.showableObjectives.last
          rows << actr
        end
      else
        rows << actr
        rowcounter = rowcounter + 1 
        actr = []
        actr << o 
        if o == perspective.showableObjectives.last
          rows << actr
        end
      end
    }
    colcounter = 1
    rows.each{|r|
      lay = lay + '<div class="row-fluid" align = "center">'
      colcounter = 1
      r.each{|o|
        dif = o.col - colcounter
        dif.times{
          lay = lay + '<div class="span2" align="center"><!--columnaVacia--></div>' 
        }
        lay = lay + '<div class="span2" align="center">'
        a = link_to image_tag(objectiveStaticButton(o,date)), objectiveatdate_path(o.id,@date.id,6)
        lay = lay + a + '</div><!--div para el link -->'
        colcounter = colcounter + dif + 1
      }
      lay = lay + '</div><!--div para el row -->'
      lay = lay + '<div class="row-fluid" align = "center"> </br></div>'
    }
    return lay.html_safe
  end 

  def perspectiveCoordinatesVectorLayout(perspective, date)
    lay = ""
    rowcounter = 1
    rows = []
    actr = []
    perspective.showableObjectives.each { |o|          
      if o.row == rowcounter
        actr << o
        if o == perspective.showableObjectives.last
          rows << actr
        end
      else
        rows << actr
        rowcounter = rowcounter + 1 
        actr = []
        actr << o 
      end
    }
    colcounter = 1
    vectcounter = 0 
    vectsize = 0 
    invector = false
    backspan = ""
    buttonspan = "" 
    #lay = lay + '<div class="span12 alert alert-error">'
    rows.each{|r|
      lay = lay + '<div class="row-fluid" align = "center">'
      colcounter = 1
      r.each{|ri|
        dif = ri.col - colcounter
        dif.times{
          lay = lay + '<div class="span2" align="center"><!--columnaVacia--></div>' 
        }
        if ri.vectors.size > 0 && vectsize == 0 
          vectsize = ri.vectors.first.inprocess
          if vectsize == 2
            backspan = '<div class="span4 alert alert-error">'
          end
          if vectsize == 3
            backspan = '<div class="span6 alert alert-error">'
          end
          lay = lay + backspan
          invector = true
        end
        if invector  
          vectcounter = vectcounter + 1
        end
        if !invector
          lay = lay + '<div class="span2" align="center"><!--inicia link fuera-->'
        end
        if vectsize > 0
          if vectsize == 2
            span = '<div class="span6 align="center"><!--dentro del vector-->'
          end
          if vectsize == 3
            span = '<div class="span9 align="center"><!--dentro del vector-->'
          end
          lay = lay + span
        end
        a = link_to image_tag(objectiveStaticButton(ri,date), :size => "148x70"), objectiveatdate_path(ri.id,@date.id,6) 
        lay = lay + a + '</div><!--div para el link -->'
        colcounter = colcounter + dif + 1
        if vectsize != 0 &&  vectcounter == vectsize
          vectsize = 0
          invector = false
          a = link_to ri.vectors.first.name , vectoratdate_path(1,@date)
          lay = lay + a
          lay = lay + '</div><!--div para el alert-error -->'
        end
      }
      lay = lay + '</div><!--div para el row -->'
    #lay = lay + '</div><!--div para el alert-error -->'
    }
    return lay.html_safe
  end 

end
