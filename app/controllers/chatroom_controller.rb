class ChatroomController < ApplicationController
    before_action :require_user_logged_in!
    def index
        @chat_room = ChatRoom.new
        @message_temp = Message.new
    end

    def join
        @chat_room = ChatRoom.find_by(name: user_params[:name])


        if @chat_room.present? && @chat_room.authenticate(user_params[:password])
            session[:message_board_id] = @chat_room.id
            redirect_to message_boards_path
        else
            redirect_to message_boards_path, notice: "incorrect name or password"
        end
    end

    def leave
        session[:message_board_id] = nil
        @chat_room = ChatRoom.new
        redirect_to message_boards_path
    end

    def create
        if ChatRoom.find_by(name: user_params[:name])
            @chat_room = ChatRoom.new
            flash[:alert] = "There is already an message board with that name"
            redirect_to message_boards_path
        else
            @chat_room = ChatRoom.new(user_params)
            if @chat_room.save
                session[:message_board_id] = @chat_room.id
                redirect_to message_boards_path, notice: "Successfully created message board"
            else
                redirect_to message_boards_path
            end
        end
    end

    private

    def user_params
        params.require(:chat_room).permit(:name, :password, :password_confirmation)
    end
end