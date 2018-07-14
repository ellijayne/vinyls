class UsersController < ApplicationController

def index
  @users = User.all
end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params #this will create user var but not in the DB
      if @user.save
        redirect_to '/'
        #TODO change above redirect so user is redirected to their 'dashboard' once they create their account
      else
        render :new
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
