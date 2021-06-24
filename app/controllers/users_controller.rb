class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def search
    if params[:user_info].present?
      @users = User.search(params[:user_info])
      if @users
        respond_to do |format|
          format.js { render partial: "friends/friend_result" }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find the user"
          format.js { render partial: "friends/friend_result" }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter an email or name"
        format.js { render partial: "friends/friend_result" }
      end
    end
  end
end
