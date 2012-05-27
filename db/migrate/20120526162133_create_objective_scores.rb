class CreateObjectiveScores < ActiveRecord::Migration
  def change
    create_table :objective_scores do |t|
      t.integer :objective_id
      t.integer :scoredate_id
      t.float :score

      t.timestamps
    end
  end
end
