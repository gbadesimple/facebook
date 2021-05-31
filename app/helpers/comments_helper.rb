module CommentsHelper

  private

  def params_comment
    params.require(:comment).permit(:body, images: [] )
  end
end
