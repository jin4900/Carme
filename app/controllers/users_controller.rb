class UsersController < ApplicationController
  
  def like
    @nickname = current_user.nickname
    @post = current_user.liked_posts.order("created_at DESC")
  end

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts.order("created_at DESC")
    
  end
end
