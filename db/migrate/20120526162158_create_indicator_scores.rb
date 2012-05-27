class CreateIndicatorScores < ActiveRecord::Migration
  def change
    create_table :indicator_scores do |t|
      t.integer :indicator_id
      t.integer :scoredate_id
      t.float :score

      t.timestamps
    end
  end
end
