class Changetype < ActiveRecord::Migration[6.1]
  def change 
    change_column :recipes, :difficulty_level, :integer 
  end
end
