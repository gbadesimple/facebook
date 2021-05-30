class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])

    if @like.save
      flash[:notice] = "You successfully liked a post"
      redirect_to posts_path(@post)
    else
      flash[:notice] = "We cannot confirm your request"
      redirect_to posts_path(@post)
    end
  end

  def destroy
    @like = Like.find(params[:id])

    if @like.destroy
      flash[:notice] = "You have successfully unlike the post"
      redirect_to posts_path
    end
  end
end
