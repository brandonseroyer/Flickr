class PostsController < ApplicationController
  before_action :find_post, except: [:new, :create, :index]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @tag = Tag.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to  posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :user_id, tag_ids: [])
  end
end
