class ApplicationController < ActionController::Base
    add_flash_types :success, :error  
    include ApplicationHelper   
    
end
