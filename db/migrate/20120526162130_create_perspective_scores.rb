class CreatePerspectiveScores < ActiveRecord::Migration
  def change
    create_table :perspective_scores do |t|
      t.integer :perspective_id
      t.integer :scoredate_id
      t.float :score

      t.timestamps
    end
  end
end
