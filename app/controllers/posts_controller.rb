class PostsController < ApplicationController
  before_action :find_post, except: [:new, :create, :index]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
    @upvote = Upvote.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    render :show
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
    @post = Post.find(params[:id])
    render :edit
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
    params.require(:post).permit(:title, :author, :image, :user_id, tag_ids: [])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
