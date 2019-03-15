class ApplicationController < ActionController::Base    

  def set_user_name
    if current_user.name.nil?
        redirect_to edit_user_url(current_user) 
    end     
  end

  
end
