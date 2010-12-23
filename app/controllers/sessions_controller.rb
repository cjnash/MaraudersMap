class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username_and_password(params[:user][:username], params[:user][:password])
    if @user
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(@user)
    else
      @user = User.new
      flash[:notice] = "Sorry, our records show that you can't get into this here site"
      render :action => "new"
    end
  end

end