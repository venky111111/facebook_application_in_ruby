class LikesController < ApplicationController
  before_action :authenticate_user!
  def index
    create
  end

  def create
  
    if params[:post_id]
      like_post
    elsif params[:postcomment_id]
      like_comment
    else
      redirect_back fallback_location: posts_path, alert: 'Invalid like request.'
    end
  end

 
  def like_post
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(user: current_user)
    redirect_to posts_path(@post), notice: 'Post liked successfully'
  end
 
  def like_comment
    @comment = Postcomment.find(params[:postcomment_id])
    @like = @comment.likes.create(user: current_user)
    redirect_to post_path(@comment.post), notice: 'Comment liked successfully'
  end
end
