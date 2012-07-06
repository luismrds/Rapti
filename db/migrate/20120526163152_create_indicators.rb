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

      t.timestamps
    end
  end
end
