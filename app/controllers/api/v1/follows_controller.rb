class Api::V1::FollowsController < ApplicationController

  before_action :authenticate_user!

  def create
    followee = User.find(params[:user_id])
    if current_user.following?(followee)
      render json: { detail: 'You are already following this user.' }, status: :bad_request
    else
      Follow.create(follower: current_user, followee: followee)
      render json: { detail: 'User followed successfully.' }, status: :created
    end
  end

  def destroy
    followee = User.find(params[:user_id])
    follow = current_user.follows.find_by(followee: followee)
    if follow
      follow.destroy
      render json: { detail: 'User unfollowed successfully.' }, status: :ok
    else
      render json: { detail: 'You are not following this user.' }, status: :bad_request
    end
  end
end
