class KeepsController < ApplicationController
    before_action :move_to_index, expect: :index
  
  def index
    @keeps = Keep.includes(:user).page(params[:page]).per(30).order("created_at DESC")
  end
  
  def new
    @keep = Keep.new
  end
  
  def create
    Keep.create(date: keep_params[:date], area: keep_params[:area], kind: keep_params[:kind], color: keep_params[:color], details: keep_params[:details], gender: keep_params[:gender], size: keep_params[:size], collar: keep_params[:collar], text: keep_params[:text], image: keep_params[:image], user_id: current_user.id)
  end
  
  def destroy
    keep = Keep.find(params[:id])
    if keep.user_id == current_user.id
      keep.destroy
    end
  end
  
  def edit
    @keep = Keep.find(params[:id])
  end
  
  def update
    keep = Keep.find(params[:id])
    if keep.user_id == current_user.id
      keep.update(keep_params)
    end
  end
  
  def show
    @keep = Keep.find(params[:id])
    @keepcomments = @keep.keepcomments.includes(:user)
  end
  
  private
  def keep_params
    params.require(:keep).permit(:date, :area, :kind, :color, :details, :gender, :size, :collar, :text, :image)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
