class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :tagcloud
  include Authentication
  helper :all # include all helpers, all the time

  protect_from_forgery with: :exception

  def tagcloud
    #find all pages for tag cloud
    #@tagpages=Page.find_all_by_clouded(true,:order => "title ASC")
    #@tagpages=Page.all_by_clouded(true,:order => "title ASC")
    @tagpages=Page.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
