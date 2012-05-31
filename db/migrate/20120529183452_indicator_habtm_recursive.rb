class IndicatorHabtmRecursive < ActiveRecord::Migration
  def up
    create_table :indicator_father_son, :id => false do |t|
      t.integer :indicatorfather_id
      t.integer :indicatorson_id
    end
  end

  def down
    drop_table :indicator_father_son
  end
end
