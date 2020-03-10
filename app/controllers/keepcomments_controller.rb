class KeepcommentsController < ApplicationController
  def create
    @keepcomment = Keepcomment.create(text: keepcomment_params[:text], keep_id: keepcomment_params[:keep_id], user_id: current_user.id)
    redirect_to "/keeps/#{@keepcomment.keep.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def keepcomment_params
    params.permit(:text, :keep_id)
  end
end
