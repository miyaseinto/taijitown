class LikesController < ApplicationController

  before_action :set_tweet, only: [:create, :destroy]

  def create
    like = Like.create(user_id: current_user.id, tweet_id: @tweet.id)
    like.save
    @tweets = Tweet.all

  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: @tweet.id)
    like.destroy
    @tweets = Tweet.all
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end