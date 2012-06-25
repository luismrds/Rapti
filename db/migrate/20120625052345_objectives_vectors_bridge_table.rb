class ObjectivesVectorsBridgeTable < ActiveRecord::Migration
  def up
    create_table :vectors_objectives, :id => false do |t|
      t.integer :vector_id
      t.integer :objective_id
    end
  end

  def down
    drop_table :vectors_objectives
  end
end
