class StaticPagesController < ApplicationController
   before_action :signup
  def home
    @micropost = current_user.microposts.build if logged_in?
  end
 
 private
  def signup
    unless logged_in?
      store_location
      redirect_to signup_path
    end 
  end
end
