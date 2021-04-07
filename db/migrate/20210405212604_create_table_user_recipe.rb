class CreateTableUserRecipe < ActiveRecord::Migration[6.1]
  def change
    create_table :table_user_recipes do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
