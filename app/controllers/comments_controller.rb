class CommentsController < ApplicationController
  before_action :find_comment, except: [:new, :create, :index]

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:post_id])
    if @comment.update(comment_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :author, :post_id, :user_id)
  end
end
