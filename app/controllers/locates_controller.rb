class LocatesController < ApplicationController
  
  before_action :move_to_index, expect: :index
  
  def index
    @locates = Locate.includes(:user).page(params[:page]).per(30).order("created_at DESC")
  end
  
  def new
    @locate = Locate.new
  end
  
  def create
    Locate.create(petname: locate_params[:petname], date: locate_params[:date], area: locate_params[:area], kind: locate_params[:kind], color: locate_params[:color], details: locate_params[:details], gender: locate_params[:gender], size: locate_params[:size], age: locate_params[:age], collar: locate_params[:collar], text: locate_params[:text], image: locate_params[:image], user_id: current_user.id)
  end
  
  def destroy
    locate = Locate.find(params[:id])
    if locate.user_id == current_user.id
      locate.destroy
    end
  end
  
  def edit
    @locate = Locate.find(params[:id])
  end
  
  def update
    locate = Locate.find(params[:id])
    if locate.user_id == current_user.id
      locate.update(locate_params)
    end
  end
  
  def show
    @locate = Locate.find(params[:id])
    @locatecomments = @locate.locatecomments.includes(:user)
  end
  
  private
  def locate_params
    params.require(:locate).permit(:petname, :date, :area, :kind, :color, :details, :gender, :size, :age, :collar, :text, :image)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end