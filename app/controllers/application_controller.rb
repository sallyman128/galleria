class ApplicationController < ActionController::Base
  before_action :require_login

  private
    def require_login
      unless session[:user_id]
        redirect_to root_path
      end
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
end
