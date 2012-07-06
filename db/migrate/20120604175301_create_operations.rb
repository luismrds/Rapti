class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
      t.string :operator, :limit => 1
      t.integer :firstoperand_id
      t.integer :secondoperand_id

      t.timestamps
    end
  end
end
