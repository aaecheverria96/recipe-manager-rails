class UsersController < ActionController::Base 
    
  def new 
    @user = User.new 
  end 

  def create
        @user = User.create(user_params) 
        if @user.valid? 
          session[:user_id] = @user.id 
          redirect_to recipes_path 
        else 
        render :new 
    end 
  end  

  def show 
   find_user   
  end 


  private

    def find_user 
      @user = User.find_by_id(params[:id]) 
    end 
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end 
end