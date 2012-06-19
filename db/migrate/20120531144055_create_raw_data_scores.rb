class CreateRawDataScores < ActiveRecord::Migration
  def change
    create_table :raw_data_scores do |t|
      t.integer :scoredate_id
      t.float :value
      t.integer :rawdata_id

      t.timestamps
    end
  end
end
