class ApplicationController < ActionController::Base
  before_action :basic_auth

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

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :language])
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end

end
