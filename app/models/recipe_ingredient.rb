class RecipeIngredient < ApplicationRecord 
    validates_presence_of :quantity 
    belongs_to :recipe 
    belongs_to :ingredient
end
