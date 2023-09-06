class ApplicationController < ActionController::Base
  def authorize_request(kind = nil)
    unless kind.include?(current_user.role)
      redirect_to posts_path, notice: "No estás autorizado a realizar esta acción."
    end
  end    
end
