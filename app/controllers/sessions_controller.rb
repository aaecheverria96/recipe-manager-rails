class SessionsController < ActionController::Base
    def new
        # nothing to do here!
    end

    def create
        @user = User.find_by(username: params[:username]) 
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to search_path
      end

    def destroy
        session.delete :username
      end 
end 
