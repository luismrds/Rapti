class SideTableFields < ActiveRecord::Migration
  def up
=begin    add_column :objectives, :progress, :float, :default => nil
    add_column :objectives, :baseline, :float, :default => nil
    add_column :objectives, :growth, :float, :default => nil    
    add_column :objectives, :goal, :float, :default => nil

    add_column :objective_scores, :progress, :float, :default => nil
    add_column :objective_scores, :baseline, :float, :default => nil
    add_column :objective_scores, :growth, :float, :default => nil
    add_column :objective_scores, :goal, :float, :default => nil

    add_column :indicators, :progress, :float, :default => nil
    add_column :indicators, :baseline, :float, :default => nil
    add_column :indicators, :growth, :float, :default => nil
    add_column :indicators, :goal, :float, :default => nil    

    add_column :indicator_scores, :progress, :float, :default => nil
    add_column :indicator_scores, :baseline, :float, :default => nil
    add_column :indicator_scores, :growth, :float, :default => nil
=end
  end

  def down
  end
end
