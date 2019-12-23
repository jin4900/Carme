class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @posts = Post.all
    @post = Post.find_by(id: params[:id])
    @like = Like.new
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
    @posts.save
  end

  def show
    @post = Post.all
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    # @comment = @post.comments.build
    @comments = @post.comments
    @like = Like.new
  end

  def edit
    @posts = Post.find_by(id: params[:id])
  end

  def update
    @posts = Post.find_by(id: params[:id])
    @posts.update(post_params)
    redirect_to root_path
  end

  def destroy
    @posts = Post.find_by(id: params[:id])
    @posts.destroy
    redirect_to("/")
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
