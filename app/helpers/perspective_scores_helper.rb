module PerspectiveScoresHelper

#Creates the instances in the PerspectiveScore Model
#to be filled by the users
    def fill_perspective_score
        perspectives = Perspective.all
        dates = ScoreDate.all
        perspectives.each{|per|
            dates.each{|da|
                PerspectiveScore.new(:perspective_id => per.id, :scoredate_id => da.id, :score => rand(100)).save
            }
        }
    end


end
