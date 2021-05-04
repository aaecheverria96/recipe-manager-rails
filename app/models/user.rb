class User < ApplicationRecord 
    has_secure_password 
    has_many :created_recipes, class_name: "Recipe", foreign_key: :creator_id
    has_many :user_recipes 
    has_many :saved_recipes, through: :user_recipes, source: :recipe
  

    def self.from_omniauth(response) 
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u| 
          u.username = response[:info][:name] 
          u.email = response[:info][:email] 
          u.password = SecureRandom.hex(15) 
        end 
    end 
end
