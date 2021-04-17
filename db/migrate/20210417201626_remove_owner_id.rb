class RemoveOwnerId < ActiveRecord::Migration[6.1]
  def change 
    remove_column :recipes, :owner_id
  end
end
