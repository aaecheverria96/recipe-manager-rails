class RecipeIngredient < ApplicationRecord 
    validates_presence_of :quantity 
end
