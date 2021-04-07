class Recipe < ApplicationRecord 
    validates :name, presence: true, uniqueness: true 
    validates :time, presence: true 
    validates :description, presence: true  
    validates :difficulty_level, presence: true, inclusion:{maximum: 5}
    validates :servings, presence: true 
    has_many :users 
    has_many :users, through: :userrecipes 
    has_many :ingredients  
end
