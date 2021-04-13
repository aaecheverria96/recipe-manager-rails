class Recipe < ApplicationRecord 
    attr_accessor :ingredients, :quantities 
    validates :name, presence: true, uniqueness: true 
    validates :time, presence: true 
    validates :description, presence: true  
    validates :difficulty_level, presence: true, numericality: {less_than_or_equal_to: 5}
    validates :servings, presence: true 
    has_many :user_recipes
    has_many :users, through: :user_recipes 
    has_many  :recipe_ingredients 
    has_many :ingredients, through: :recipe_ingredients 

    scope :search_by_keyword, -> (search){where("name LIKE ?", "#{search}%").order(:name)} 
end
