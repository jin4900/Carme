class PostsController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
    @post = Post.find_by(id: params[:id])
    @like = Like.new
    @comment = Comment.new
    # @comments = @post.comments
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
    if @posts.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    # @comment = @post.comments.build
    @comments = @post.comments.order("created_at DESC")
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
