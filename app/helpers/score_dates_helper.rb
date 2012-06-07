module ScoreDatesHelper

    def currentScoreDate
        return ScoreDate.find_by_month_and_year(Date.today.month,Date.today.year)
    end
end
