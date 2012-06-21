class CreatePerspectives < ActiveRecord::Migration
  def change
    create_table :perspectives do |t|
      t.string :name
      t.float :weight
#      t.float :score Not need anymore. Now in perspective_score
      t.float :redfrom
      t.float :redto
      t.float :yellowfrom
      t.float :yellowto
      t.float :greenfrom
      t.float :greento      
      

      t.timestamps
    end
  end
end
