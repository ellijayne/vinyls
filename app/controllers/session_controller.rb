class SessionController < ApplicationController
  def new
  end

  def create
    #get use with this email address:
    user = User.find_by :username => params[:username]
    #if passwords match (encrypted ones)
    if user.present? && user.authenticate(params[:password])
      #remeber this user in the session Hash
      session[:user] = user.id
      #and redirect them to home page #NOTE CHANGE THIS TO DASH PAGE!
      redirect_to root_path
      #else if the passwords dont match, redirect them to the login
    else
      redirect_to login_path
    end
  end
end
