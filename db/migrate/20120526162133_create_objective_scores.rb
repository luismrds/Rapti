class CreateObjectiveScores < ActiveRecord::Migration
  def change
    create_table :objective_scores do |t|
      t.integer :objective_id
      t.integer :scoredate_id
      t.float :score
      t.float :redfrom
      t.float :redto
      t.float :yellowfrom
      t.float :yellowto
      t.float :greenfrom
      t.float :greento

      t.timestamps
    end
  end
end
