class DashboardsController < ApplicationController
  
  def index
    @user = current_user
    params[:status] == 'offline' ? online = false : online = true
    @pages = Page.by_section.where(:online => online).page params[:page]
    @sections = Section.all
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def search
    @pages = Page.search(params[:search])
  end
  
end
