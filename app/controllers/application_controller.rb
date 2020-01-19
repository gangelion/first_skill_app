class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if user_signed_in?
      main_index_path
    else
      mentors_main_index_path
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
end
