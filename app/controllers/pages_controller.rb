class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  
  before_filter :authenticate_user!
  
  def index
    
    if params[:status] == "offline"
      @pages = Page.offline.all(:order => 'headline ASC')
    elsif params[:status] == "live!"
      @pages = Page.live.all(:order => 'headline ASC')
    elsif params[:section] == "Membership"
      @pages = Page.membership.all(:order => 'headline ASC')
    elsif params[:section] == "Travel"
      @pages = Page.travel.all(:order => 'headline ASC')
    elsif params[:section] == "Auto"
      @pages = Page.auto.all(:order => 'headline ASC')
    elsif params[:section] == "Registries"
      @pages = Page.registries.all(:order => 'headline ASC')
    elsif params[:section] == "Insurance"
      @pages = Page.insurance.all(:order => 'headline ASC')
    elsif params[:section] == "Deals"
      @pages = Page.deals.all(:order => 'headline ASC')
    elsif params[:section] == "Driver Ed"
      @pages = Page.drivered.all(:order => 'headline ASC')
    elsif params[:section] == "Financial*"
      @pages = Page.financial.all(:order => 'headline ASC')
    elsif params[:section] == "Community & AMA"
      @pages = Page.communityandama.all(:order => 'headline ASC')
    elsif params[:section] == "Other"
      @pages = Page.other.all(:order => 'headline ASC')
    elsif params[:created_by] == "Christopher.Nash"
      @pages = Page.christopher.all(:order => 'headline ASC')
    elsif params[:created_by] == "Amanda.Doucette"
      @pages = Page.amanda.all(:order => 'headline ASC')
    elsif params[:created_by] == "Laura.Urbanowski"
      @pages = Page.laura.all(:order => 'headline ASC')
    elsif params[:created_by] == "Krista.Vieira"
      @pages = Page.krista.all(:order => 'headline ASC')
    elsif params[:created_by] == "Jason.Buzzell"
      @pages = Page.jason.all(:order => 'headline ASC')
    elsif params[:created_by] == "Johnn.Four"
      @pages = Page.johnn.all(:order => 'headline ASC')
    elsif params[:created_by] == "Darrell.Winwood"
      @pages = Page.darrell.all(:order => 'headline ASC')
    elsif params[:created_by] == "RuthAnn.Raycroft"
      @pages = Page.ruthann.all(:order => 'headline ASC')
    elsif params[:created_by] == "Dwain.SagerWilson"
      @pages = Page.dwain.all(:order => 'headline ASC')
    elsif params[:created_by] == "Esci.Cagaoan"
      @pages = Page.esci.all(:order => 'headline ASC')
    elsif params[:created_by] == "Sarah.VanTassel"
      @pages = Page.sarahvt.all(:order => 'headline ASC')
    else
      @pages = Page.search(params[:search])
    end
    
    @user = current_user
    @counter = Page.live.count
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])
    @user = current_user
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
    @user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
    @user = current_user
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
    @user = current_user
    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page, :notice => 'Page was successfully created.') }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])
    @user = current_user
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to(@page, :notice => 'Page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url, :notice => 'The page has vanished.') }
      format.xml  { head :ok }
    end
  end
end
