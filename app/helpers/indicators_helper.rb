module IndicatorsHelper

  include OperationsHelper

    def calculateIndicatorValue(dateid)
        return self.operation.calculateOperationValue(dateid) 
    end

    def getLastN(n, indicator, date)
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
            scores.unshift(IndicatorScore.find_by_indicator_id_and_scoredate_id(indicator.id, d.id))            
        }
        return scores 
    end
end
