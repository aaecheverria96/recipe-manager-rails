class RecipesController < ApplicationController
    before_action :find_recipe, only: [:edit, :update, :destroy, :show]
    before_action :redirect_if_not_creator, only: [:edit, :update, :destroy]

    def new 
        if params[:user_id]
            @user = User.find_by_id(params[:user_id]) 
            @recipe = @user.recipes.build(creator_id: @user.id)
        else 
            @recipe = Recipe.new 
        end 
    end  

    def edit 
    
    end 

    def update  
        if @recipe.update(recipe_params) 
            ingredients = params[:recipe][:ingredients_names].split(",")
            quantities = params[:recipe][:ingredients_quantities].split(",")
            new_recipe_ingredients = []
            old_recipe_ingredients = @recipe.recipe_ingredients.map(&:id) 
            ingredients.each_with_index do |i, index| 
                item = Ingredient.find_or_create_by(name: i.capitalize.strip) 
                recipe_item =  RecipeIngredient.find_or_create_by(ingredient_id: item.id, recipe_id: @recipe.id) do  |ri| 
                   ri.quantity = quantities[index].strip.capitalize 
                end 
                new_recipe_ingredients << recipe_item.id 
            end
            ids = old_recipe_ingredients - new_recipe_ingredients 
            ids.each  { |id| RecipeIngredient.delete(id) } 
            flash[:success] = "Edit successfull"
            redirect_to recipe_path(@recipe) 
        else 
            flash[:error] =  @recipe.errors.full_messages
            render :edit 
        end 
    end
    
    def index 
        if params[:search]
            @recipes = Recipe.search_by_name(params["search"])
         elsif params[:user_id] 
           
            @recipes = User.find_by_id(params[:user_id]).recipes
        else 
            @recipes = Recipe.all.order(:name) 
        end 
    end  

    def destroy 
       if  @recipe.destroy
        flash[:success] = "Deleted"
            redirect_to recipes_path
       else 
           flash[:error] =  @recipe.errors.full_messages 
            redirect_to recipe_path(@recipe) 
       end 
    end 

    def show  
        @comment = Comment.new(recipe: @recipe) 
    end  

    def create 
        @recipe = Recipe.new(recipe_params)  
        @recipe.creator_id = current_user.id 
        if @recipe.save
            current_user.recipes << @recipe 
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
        params.require(:recipe).permit(:name, :description, :time, :difficulty_level, :servings, :creator_id) 
    end 

    def redirect_if_not_creator 
        if @recipe.creator != current_user  
            redirect_to recipe_path(@recipe)
        end 
    end 

end