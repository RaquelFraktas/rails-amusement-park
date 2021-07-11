class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user.create(user_params)
      if @user.save
        session[:user_id] = @user.id
      else
        redirect_to 'new'
      end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :height, :naseau, :admin, :tickets, :happiness)
    end
end
