class ApplicationController < ActionController::Base
  
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
  
  protected
  
    def authenticate_user!
      redirect unless session[:user_id] && User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      redirect
    end  
  
    def sign_in_and_redirect(user)
      session[:user_id] = user.id
      redirect_to stored_location || after_sign_in_path
    end
  
    def sign_out_and_redirect
      session[:user_id] = nil
      redirect_to after_sign_out_path, :notice => "Signed out!"
    end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def redirect
      store_location!
      redirect_to new_session_path
    end
  
    def store_location!
      session[:return_to] = request.fullpath if request.get?
    end
  
    def stored_location
      session.delete("return_to")
    end
  
    def after_sign_in_path
      root_path
    end
  
    def after_sign_out_path
      root_path
    end
end