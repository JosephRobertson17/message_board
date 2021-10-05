class MessageController < ApplicationController
    def send_message
        if session[:message_board_id]
            Message.create(chat_room_id: Current.message_board.id, username: Current.user.username, data: message_params[:data])
            redirect_to message_boards_path
        end
    end

    private

    def message_params
        params.require(:message).permit(:data)
    end
end