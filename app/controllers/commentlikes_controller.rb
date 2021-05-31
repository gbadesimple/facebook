class CommentlikesController < ApplicationController

  def create
    @commentlike = current_user.commentlikes.create(post_id: params[:post_id], comment_id: params[:comment_id])

    if @commentlike.save
      flash[:notice] = "You successfully liked a comment"
      redirect_to posts_path
    else
      flash[:alert] = "We cannot process your request please try again"
      redirect_to posts_path
    end
  end

  def destroy
    @commentlike = current_user.commentlikes.find(params[:id])
    if @commentlike.destroy
      flash[:notice] = "You have unliked a comment"
      redirect_to posts_path
    else
      flash[:alert] = "Ooops! we are unable to unlike the comment"
      redirect_to posts_path
    end
  end

end
