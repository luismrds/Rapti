class CreatePerspectiveScores < ActiveRecord::Migration
  def change
    create_table :perspective_scores do |t|
      t.integer :perspective_id
      t.integer :scoredate_id
      t.float :score
      t.float :redfrom
      t.float :redto
      t.float :yellowfrom
      t.float :yellowto
      t.float :greenfrom
      t.float :greento
      t.float :goal

      t.timestamps
    end
  end
end
