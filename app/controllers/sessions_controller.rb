class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate!(params[:session][:username], params[:session][:password])
    if @user
      flash[:notice] = "Welcome to the Marauder's Map."
      sign_in_and_redirect(@user)
    else
      @user = User.new
      flash[:notice] = "Your magic words were wrong. Try again."
      render :action => "new"
    end
  end

end