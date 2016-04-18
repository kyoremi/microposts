class StaticPagesController < ApplicationController
   before_action :signup
   
 def home
 end
 
 private
  def signup
    unless logged_in?
      store_location
      redirect_to signup_path
    end 
  end
end
