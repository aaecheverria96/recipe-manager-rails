class CreateTableRecipeIngredient < ActiveRecord::Migration[6.1]
  def change
    create_table :table_recipe_ingredients do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
