class AddOwner < ActiveRecord::Migration[6.1]
  def change 
    add_column :recipes, :owner_id, :integer 
  end
end
