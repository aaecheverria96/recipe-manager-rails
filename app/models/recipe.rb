class Recipe < ApplicationRecord 
    attr_accessor :ingredients_names, :ingredients_quantities
    validates :name, presence: true, uniqueness: true 
    validates :time, presence: true 
    validates :description, presence: true  
    validates :difficulty_level, presence: true, numericality: {less_than_or_equal_to: 5}
    validates :servings, presence: true
    has_many  :recipe_ingredients 
    has_many :ingredients, through: :recipe_ingredients 
    has_many :comments 
    belongs_to :creator, class_name: "User" 

    scope :search_by_name, -> (search){where("name LIKE ?", "#{search}%")}  

   

    def format_ingredient_quantities
        self.recipe_ingredients.map do |ri| 
            "#{ri.ingredient.name}, #{ri.quantity}"  

        end 
    end 

    def show_ingredient_names 
        self.recipe_ingredients.map do |ri| 
            ri.ingredient.name
        end.join(", ")
    end

    def show_ingredient_quantities 
        self.recipe_ingredients.map do |ri| 
            ri.quantity
        end.join(", ")
    end 

    def like_or_unlike(current_user) 
        if current_user.saved_recipes.include?(self) 
           "Unlike" 
        else 
           "Like" 
        end  
    end 
end
