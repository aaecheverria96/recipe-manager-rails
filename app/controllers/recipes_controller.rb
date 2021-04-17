class RecipesController < ApplicationController
    # before_action :require_login 

    def new 
        @recipe = Recipe.new 
    end  

    def edit 
        find_recipe  
        redirect_to recipe_path(@recipe)
    end 

    def update
        find_recipe 
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe) 
    end 
    
    def index 
       @recipes = Recipe.all.order(:name) 
    end  

    def destroy 
        find_recipe.destroy 
        redirect_to recipes_path
    end 

    def show 
        find_recipe  
        @comment = Comment.new(recipe: @recipe)
    end  

    def create 
        @recipe = Recipe.create(recipe_params) 
        if @recipe.valid? 
            ingredients = params[:recipe][:ingredients_names].split(",")  
            quantities = params[:recipe][:ingredients_quantities].split(",") 
            ingredients.each_with_index do |i, index| 
                item = Ingredient.find_or_create_by(name: i.capitalize.strip) 
                recipe_item =  @recipe.recipe_ingredients.build(ingredient_id: item.id, quantity: quantities[index].strip.capitalize) 
                recipe_item.save 
               if !recipe_item.valid? 
                flash[:error] = "Could not save #{item.name}" 
               end 
            end
            redirect_to recipe_path(@recipe)
        else 
          render :new 
        end 
    end  

    private 

    def find_recipe 
        @recipe = Recipe.find_by_id(params[:id])
    end  

    def recipe_params 
        params.require(:recipe).permit(:name, :description, :time, :difficulty_level, :servings) 
    end 

end