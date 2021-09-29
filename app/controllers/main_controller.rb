class MainController < ApplicationController
    def index
        flash[:notice] = "logged in successfully"
        flash[:alert] = "Invalid email or password"
    end
end