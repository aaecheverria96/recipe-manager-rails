class SessionController < ActionController::Base
    def new
        # nothing to do here!
    end

    def create
        session[:username] = params[:username]
        redirect_to '/'
    end 

    def destroy
        session.delete :username
      end 
end