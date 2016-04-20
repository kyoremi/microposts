class UsersController < ApplicationController
  def index #ヘッダーのusers
   @user = User.find(params[:id])
  end
  
  def show 
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
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

  def followings  #@usersはユーザーのフォローしたユーザー
    @user = User.find(params[:id])
    @users = @user.following_users
    #render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
    #render 'show_follow'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
