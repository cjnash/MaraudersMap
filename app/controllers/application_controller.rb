class ApplicationController < ActionController::Base
  
  before_filter :authenticate_user!
  
  protect_from_forgery
  
  helper_method :current_user
  before_filter :set_timezone

  def set_timezone
    # current_user.time_zone #=> 'London'
    Time.zone = 'Mountain Time (US & Canada)'
  end

  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => :not_found
  end
  
end