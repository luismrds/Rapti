module ObjectiveScoresHelper

#Creates the instances in the ObjectiveScore Model
#to be filled by the users
    def fill_objective_score
        objectives = Objective.all
        dates = ScoreDate.all
        objectives.each{|obj|
            dates.each{|da|
                ObjectiveScore.new(:objective_id => obj.id, :scoredate_id => da.id, :score => rand(100)).save
            }
        }
    end


end
