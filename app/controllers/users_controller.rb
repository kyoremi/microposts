class UsersController < ApplicationController
  
  def show 
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
       flash[:success] = "Welcome to the Sample App!"
    else
    render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile edit"
      redirect_to edit_user_path
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :prefecture_id, :url, :self_introduction)
  end
end
