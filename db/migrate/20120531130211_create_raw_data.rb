class CreateRawData < ActiveRecord::Migration
  def change
    create_table :raw_data do |t|
      t.string :name
      t.integer :operation_id
      t.float :default_value, :default => 1

      t.timestamps
    end
  end
end
