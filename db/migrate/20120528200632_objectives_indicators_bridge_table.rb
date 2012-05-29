class ObjectivesIndicatorsBridgeTable < ActiveRecord::Migration
  def up
      create_table :indicators_objectives, :id => false do |t|
      t.integer :indicator_id
      t.integer :objective_id
    end
  end

  def down
    drop_table :indicators_objectives
  end
end



