class Api::V1::FollowsController < ApplicationController
  def create
    followee = User.find(params[:user_id])
    if Follow.exists?(follower: current_user, followee: followee)
      render json: { detail: 'You are already following this user.' }, status: :bad_request
    else
      Follow.create(follower: current_user, followee: followee)
      render json: { detail: 'User followed successfully.' }, status: :created
    end
  end

  def destroy
    followee = User.find(params[:user_id])
    follow = Follow.find_by(follower: current_user, followee: followee)
    if follow
      follow.destroy
      render json: { detail: 'User unfollowed successfully.' }, status: :ok
    else
      render json: { detail: 'You are not following this user.' }, status: :bad_request
    end
  end
end
