class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @posts = Post.where(user_id: current_user.id)
  end
end
