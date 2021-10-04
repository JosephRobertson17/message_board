class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_current_message_board

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def set_current_message_board
        if session[:message_board_id]
            Current.message_board = ChatRoom.find_by(id: session[:message_board_id])
        end
    end
        
    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be logged in to do that." if Current.user.nil?
    end
end
