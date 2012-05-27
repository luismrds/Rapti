class CreateScoreDates < ActiveRecord::Migration
  def change
    create_table :score_dates do |t|
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
