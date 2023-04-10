class CommentsController < ApplicationController
  include CommentsHelper
  include ApplicationHelper

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    friendrequests
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all.order(created_at: :desc)
    friendrequests
  end

  def create
    @user = current_user
    @comment = @user.comments.create(params_comment)
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:notice] = "Comment created successfully"

      redirect_to new_post_comment_path
    else
      flash[:alert] = "We could not process your request at this time, please try again later"

      render :new
    end
  end

  def show
  #  @comment = Comment.find(params[:id])
  #  @post = Post.find(params[:post_id])
  #  @comment.post_id = @comment.id
  end

  def update
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(params_comment)
      flash[:notice] = "Comment updated succesfully"
      redirect_to posts_path
    else
      flash[:alert] = "We couldn't update your comment"

      render action: :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment successfully destroyed"
      redirect_to posts_path
    else
      flash[:alert] = "Unable to destroy comment"

      redirect_to posts_path
    end
  end

end
