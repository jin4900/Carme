class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @comments = @post.comments
    @comment = Comment.new
    # @comment.post_id = @post.id
    @comment = Comment.create(comment_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    redirect_to post_path(@post.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id], user_id: current_user.id)
  end
end
