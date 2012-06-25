class CreateVectors < ActiveRecord::Migration
  def change
    create_table :vectors do |t|
      t.string :name

      t.timestamps
    end
  end
end
