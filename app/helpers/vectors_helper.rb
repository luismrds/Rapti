module VectorsHelper

  def perspectiveDetails(objectives, date)
    rows = 0 
    rows = rows + objectives.size + 1
    objectives.each {|o|
      rows = rows + o.indicators.size
    }
    lay = ""
    lay = lay + '<tr>
      	  <td rowspan="'+rows.to_s+'">'
    
    a = link_to image_tag(objectives.first.perspective.title_image), showdashboard_path("objectives", "current", 4, @date.id), :style=>'color:#FFFFFF;'

    lay = lay + a + '</td>'

    objectives.each{|o|
      lay = lay + '<tr>'
      lay = lay + '<td colspan = "2">'
        a = ObjectiveScore.find_by_objective_id_and_scoredate_id(o.id,date.id)
        lay = lay+ o.acronym.to_s + '</td>' + '<td>'+ "%" + '</td>'
        lay = lay+ '<td>'+ a.score.to_s + '</td>'
        lay = lay+ '<td>'+ a.goal.to_s + '</td>'
        lay = lay+ '<td>'+ a.progress.to_s+ '</td>'
        lay = lay+ '<td>'+ a.baseline.to_s+ '</td>'
        lay = lay+ '<td>'+ a.growth.to_s+ '</td></tr>'
        o.indicators.each{|i|
          ind = IndicatorScore.find_by_indicator_id_and_scoredate_id(i.id,date.id)
          link = link_to ind.indicator.acronym, indicatoratdate_path(ind.indicator_id,ind.scoredate_id,6), :class => indicatorscorestate(ind), :style=>'color:#FFFFFF;'

          lay = lay + '<tr><td></td><td>' + link + '</td>'
          lay = lay + '<td>' + i.unit + '</td>'
          lay = lay+ '<td>'+ ind.score.to_s + '</td>'
          lay = lay+ '<td>'+ ind.goal.to_s + '</td>'
          lay = lay+ '<td>'+ ind.progress.to_s+ '</td>'
          lay = lay+ '<td>'+ ind.baseline.to_s+ '</td>'
          lay = lay+ '<td>'+ ind.growth.to_s+ '</td></tr>'
        }
      lay = lay + '</td>'
      lay = lay + '</td>'     
    }

    return lay.html_safe
  end

end
