class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :name
      t.string :acronym
      t.float :weight
      t.float :score
      t.integer :perspective_id
      t.float :redfrom
      t.float :redto
      t.float :yellowfrom
      t.float :yellowto
      t.float :greenfrom
      t.float :greento
      t.float :progress
      t.float :baseline
      t.float :growth
      t.string :measurement
      t.string :acronym
      t.boolean :show, :default => true
      t.string :greenButton
      t.string :redbutton
      t.integer :col
      t.integer :row 

      t.timestamps
    end
  end
end
