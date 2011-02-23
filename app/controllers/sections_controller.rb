class SectionsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    params[:status] == 'offline' ? online = false : online = true
    @pages = Page.by_section.where(:online => online).page params[:page]
    @sections = Section.all
    respond_to do |format|
      format.html { }
      format.xml  { }
    end
  end
  
  def show
    @section = Section.find(params[:id])
    respond_to do |format|
      format.html { }
      format.xml  { }
    end
  end
  
end