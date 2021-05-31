module PostsHelper

  private
  
  def post_params
    params.require(:post).permit(:title, images: [] )
  end
end
