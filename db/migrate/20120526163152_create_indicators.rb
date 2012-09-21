class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :name
      t.string :acronym
      t.float :weight
      t.integer :objective_id
      t.integer :operation_id
      t.float :redfrom
      t.float :redto
      t.float :yellowfrom
      t.float :yellowto
      t.float :greenfrom
      t.float :greento
      t.float :progress
      t.float :baseline
      t.float :growth
      t.string :acronym
      t.string :unit
      t.string :formula
      t.boolean :show, :default => true


      t.timestamps
    end
  end
end
