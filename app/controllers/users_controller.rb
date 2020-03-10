class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tweets = @user.tweets.page(params[:page]).per(30).order("created_at DESC")
    @locates = @user.locates.page(params[:page]).per(30).order("created_at DESC")
    @keeps = @user.keeps.page(params[:page]).per(30).order("created_at DESC")
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    current_user.update(update_params)
  end
  
  private
  def update_params
    params.require(:user).permit(:nickname, :website, :selfintroduction, :image)
  end
end