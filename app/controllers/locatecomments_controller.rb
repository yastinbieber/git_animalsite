class LocatecommentsController < ApplicationController
  def create
    @locatecomment = Locatecomment.create(text: locatecomment_params[:text], locate_id: locatecomment_params[:locate_id], user_id: current_user.id)
    redirect_to "/locates/#{@locatecomment.locate.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def locatecomment_params
    params.permit(:text, :locate_id)
  end
end
