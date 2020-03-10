class TweetsController < ApplicationController
  
  before_action :move_to_index, expect: :index #indexが読み込まれる前に:move_to_indexが読み込まれる
  
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(30).order("created_at DESC")
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    Tweet.create(image: tweet_params[:image], catchphrase: tweet_params[:catchphrase], text: tweet_params[:text], user_id: current_user.id)
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :catchphrase, :text)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
