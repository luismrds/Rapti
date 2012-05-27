class CleanPerspectivesAndObjectives < ActiveRecord::Migration
  def change 
	remove_column :perspectives,:score
	remove_column :objectives,:score
  end
end
