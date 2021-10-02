class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if User.find_by(email: user_params[:email])
            @user = User.new
            flash[:alert] = "There is already an account with that email"
            render :new
        else
            @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to root_path, notice: "Successfully created account"
            else
                render :new
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end