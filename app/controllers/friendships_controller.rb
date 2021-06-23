class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:friend_id])
    @friendship = Friendship.new(user: current_user, friend: user)
    if @friendship.save
      flash[:notice] = "You had successfully followed #{user.first_name}"
      redirect_to friends_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to friends_path
    end
  end

  def destroy
    user = User.find(params[:id])
    friendship = Friendship.where(user_id: current_user.id, friend_id: user.id).first
    if friendship.destroy
      flash[:notice] = "You had successfully unfollowed #{user.first_name}"
      redirect_to friends_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to friends_paths
    end
  end
end
