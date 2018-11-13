class ApplicationController < ActionController::Base
  helper_method :current_blog
  def current_blog
    @current_blog = Blog.find(params[:id])
  end


end
