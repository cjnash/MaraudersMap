class ProfilesController < ApplicationController
  
  def index
    params[:status] == 'offline' ? online = false : online = true
    @pages = Page.by_section.where(:online => online).page params[:page]
    @sections = Section.all
    @profiles = Profile.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
    end
  end
  
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profiles }
    end
  end
  
end
