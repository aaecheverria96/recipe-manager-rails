class AddIndextoCreatorId < ActiveRecord::Migration[6.1]
  def change 
    add_index :recipes, :creator_id 
  end
end
