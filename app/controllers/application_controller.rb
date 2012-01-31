class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if (user_signed_in?)
      redirect_to root_url, :alert => exception.message
    else
      redirect_to new_user_session_path, :alert => "#{exception.message} Please sign in..."
    end
  end

protected

  def layout_by_resource
    if params[:controller] == "devise/sessions" # && params[:action] == "new"
      "application"
    else
      "scaffold"
    end
  end
end

