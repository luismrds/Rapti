module ScoreDatesHelper

# Da la instancia de scoredate que representa el mes actual.

  def currentScoreDate
      return ScoreDate.find_by_month_and_year(Date.today.month,Date.today.year)
  end

# Dado un scoredate, devuelve el nombre en texto del mes que representa 

  def scoredate_month_to_text(scoredate)
    month = scoredate.month
    return number_to_month(month)
  end

  def zeroToUseless
    [13,14,15,16,17,18,19,20].each{|i|
      puts i       
      date = ScoreDate.find(i)
      inds = date.indicatorscores
      inds.each{|is|
        is.score = 0
        is.save    
      }
    }
  end

# Dado el numero de mes, devuelve el nombre en texto 

  def number_to_month(n)
    case n
    when 1
      return "Enero"
    when 2
      return "Febrero"
    when 3
      return "Marzo"
    when 4
      return "Abril"
    when 5
      return "Mayo"
    when 6
      return "Junio"
    when 7
      return "Julio"
    when 8
      return "Agosto"
    when 9
      return "Septiembre"
    when 10
      return "Octubre"
    when 11
      return "Noviembre"
    when 12
      return "Diciembre"
    end
  end
end
