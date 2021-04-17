class SessionsController < ActionController::Base
    def new
        # nothing to do here!
    end

    def create 
       @user = User.find_by(username: params[:username]) 
       if  @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id  
          flash[:success] = "Login successfull"
          redirect_to recipes_path 
       else 
        # flash[:notice] = "Invalid Credentials" 
        redirect_to login_path, notice: "Invalid Credentials" 
      end
    end 

    def omniauth 
      user = User.from_omniauth(request.env['omniauth.auth']) 
        if user.valid? 
          session[:user_id] = user.id  
          flash[:success] = "Login Successful!"
          redirect_to recipes_path 
        else 
           redirect_to '/login' 
        end 
    end 

    def destroy
        session.delete :user_id
        redirect_to login_path
      end 
end 
