class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :name
      t.float :weight
      t.integer :objective_id

      t.timestamps
    end
  end
end
