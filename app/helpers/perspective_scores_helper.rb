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
      puts "NUMERO DE FILA" + rowcounter.to_s
      puts "NUMERO del objetivo" + o.row.to_s      
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
    rows.each{|r|
      lay = lay + '<div class="row-fluid" align = "center">'
      colcounter = 1
      r.each{|o|
        dif = o.col - colcounter
        dif.times{
          lay = lay + '<div class="span3" align="center"><!--columnaVacia--></div>' 
        }
        lay = lay + '<div class="span3" align="center">'
        a = link_to image_tag(objectiveStaticButton(o,date), :size => "148x70"), objectiveatdate_path(o.id,@date.id,6) 
        lay = lay + a + '</div><!--div para el link -->'
        colcounter = colcounter + dif + 1
      }
      lay = lay + '</div><!--div para el row -->'
    }
    return lay.html_safe

=begin
    perspective.showableObjectives.each { |o|
      if o.row != row
        lay = lay + '</div><!--otroRow--><div class="row-fluid" align = "center">'
      end
      t = o.col - col - 1
      t.times{ lay = lay + '<div class="span3" align="center"><!--Multiples--></div>' }
      lay = lay + '<div class="span3" align="center">'
      a = link_to image_tag(objectiveStaticButton(o,date), :size => "148x70"), objectiveatdate_path(o.id,@date.id,6) 
      lay = lay + a
      lay = lay + "</div><!--span3-->"
      row = o.row
      col = o.col
    }
=end
  end 

end
