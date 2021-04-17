class CommentsController < ApplicationController
    
    def new 
        @comment = Comment.new 
    end  

    def create 
        @comment = Comment.new(comment_params)  
        @comment.user_id = current_user.id 
        if @comment.save
            flash[:success] = "Comment successfully created"
        else 
            redirect_to recipe_path(@comment.recipe)
            flash[:error] = @comment.errors.full_messages.to_sentence 
        end 
        redirect_to recipe_path(@comment.recipe)
    end  

    private 

    def comment_params 
        params.require(:comment).permit(:recipe_id, :user_id, :text) 
    end 

end