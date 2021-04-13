class AddColumnsToRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipe_ingredients, :recipe, null: false, foreign_key: {on_delete: :cascade}
    add_reference :recipe_ingredients, :ingredient, null: false, foreign_key: {on_delete: :cascade}
  end
end
