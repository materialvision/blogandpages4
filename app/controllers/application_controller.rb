class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Authentication
  helper :all # include all helpers, all the time

  protect_from_forgery with: :exception

  def tagcloud
    #find all pages for tag cloud
    #@tagpages=Page.find_all_by_clouded(true,:order => "title ASC")
    #@tagpages=Page.all_by_clouded(true,:order => "title ASC")
    @tagpages=Page.all
  end
end
