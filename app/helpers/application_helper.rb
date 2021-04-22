module ApplicationHelper 
    def current_user 
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id] 
    end 

    def loggedin?
        !!current_user 
    end 

    def recipe_index 

     tag.ul do 
         @recipes.each do |recipe| 
           concat content_tag :li, link_to(recipe.name, recipe_path(recipe))
        end 
    end.html_safe

    end 
end
