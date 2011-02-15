class FoldersController < ApplicationController
  
  def index
    @folder = Folder.find_by_folder_id(nil)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folder }
    end
  end
  
  def show
    @folder = Folder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @folder }
    end
  end
  
end
