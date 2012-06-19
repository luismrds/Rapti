class AddGoalToIndicatorsScore < ActiveRecord::Migration
  def up
    add_column :indicator_scores, :goal, :float, :default => 0.0
  end

  def down
    remove_column :indicator_scores, :goal
  end 
end
