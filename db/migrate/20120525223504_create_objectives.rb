class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :name
      t.float :weight
      t.float :score
      t.integer :perspective_id

      t.timestamps
    end
  end
end
