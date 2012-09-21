class CreateIndicatorScores < ActiveRecord::Migration
  def change
    create_table :indicator_scores do |t|
      t.integer :indicator_id
      t.integer :scoredate_id
      t.float :score
      t.float :goal, :default => 0.0
      t.float :redfrom
      t.float :redto
      t.float :yellowfrom
      t.float :yellowto
      t.float :greenfrom
      t.float :greento
      t.float :baseline
      t.float :growth
      t.float :progress

      t.timestamps
    end
  end
end
