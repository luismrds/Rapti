class CreatePerspectives < ActiveRecord::Migration
  def change
    create_table :perspectives do |t|
      t.string :name
      t.float :weight
      t.float :score

      t.timestamps
    end
  end
end
