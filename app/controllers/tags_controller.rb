class TagsController < ApplicationController
  before_action :find_tag, except: [:index, :new, :create]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_post_path
    end
  end
  
  def update
    if @tag.update(tag_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to posts_path
  end

  private
  
  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
