class UpvotesController < ApplicationController
  def create
    @user = User.find(params[:upvote][:user_id])
    @post = Post.find(params[:upvote][:post_id])
    @upvote = Upvote.new(post: @post, user: @user)
  
    if @upvote.save
      respond_to do |format|
        format.html { redirect_to @upvote.post }
        format.js
      end
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy
    flash[:notice] = "Task successfully deleted."
    redirect_to post_path(@upvote.post)
  end

  private
  def secure_params
    params.require(:upvote).permit(:user, :post)
  end
end
