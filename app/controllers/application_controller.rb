class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :banned

    def banned
        if current_user && current_user.role == 'banned'
            redirect_to '/banned'
        end
    end
end
