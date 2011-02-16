class DashboardsController < ApplicationController
  
  def index
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
end
