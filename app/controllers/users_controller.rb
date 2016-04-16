class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :me?, only: [:edit, :update]
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
    #if @user.update_attributes(user_params)
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to user_path
    else
      render 'edit'
      flash[:warning] = "再度　入力してください。"
    end
  end
  
  private

  def user_params
    #params.require(:user).permit(:name, :email, :password,:password_confirmation, :prefecture_id, :url, :self_introduction)
    params.require(:user).permit(:name, :email, :password,:password_confirmation, :url, :self_introduction, :area)
  end
  
  def set_user
    @user = User.find(params[:id])
    #@user = User.find_by(params[:session])
    #@user=logged_in?
  end
  
  def me?
     #if session[:user_id].to_i != params[:id].to_i
     if current_user != @user
      redirect_to root_path
      flash[:danger] = "ログインしてください。"
     end
  end 
end
