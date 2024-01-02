class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:index]
 

  def index

    if (@post.present? && @post.likes.exists?(user: current_user)) || (@postcomment.present? && @postcomment.likes.exists?(user: current_user))
      destroy
    else
      create
    end
    

  end

  def create
    if params[:post_id]
      like_post
    elsif params[:postcomment_id]
      like_comment
    else
      redirect_back fallback_location: root_path, alert: 'Invalid like request.'
    end
  end

  def destroy
  
    if params[:post_id]
      unlike_post
    elsif params[:postcomment_id]
      unlike_comment
    else
      redirect_back fallback_location: root_path, alert: 'Invalid unlike request.'
    end
  end
  def set_post
    if params[:post_id].present?
      @post = Post.find_by(id: params[:post_id])
      @postcomment = nil
    elsif params[:postcomment_id].present?
      @postcomment = Postcomment.find_by(id: params[:postcomment_id])
      @post = nil
    else
      @post = nil
      @postcomment = nil
    end
  end
  
  private

  def like_post
    @post = Post.find(params[:post_id])
    if @post.likes.exists?(user: current_user)
      redirect_to posts_path(@post), alert: 'You have already liked this post.'
    else
      @like = @post.likes.create(user: current_user)
      redirect_to posts_path(@post), notice: 'Post liked successfully'
    end
  end

  def unlike_post
    @post = Post.find(params[:post_id])
    like = @post.likes.find_by(user: current_user)
    if like
      like.destroy
      redirect_to posts_path(@post), notice: 'Post unliked successfully'
    else
      redirect_to posts_path(@post), alert: 'You have not liked this post.'
    end
  end

  def like_comment
    @comment = Postcomment.find(params[:postcomment_id])
      @like = @comment.likes.create(user: current_user)
      redirect_to post_path(@comment.post), notice: 'Comment liked successfully'
    
  end

  def unlike_comment
    @comment = Postcomment.find(params[:postcomment_id])
    like = @comment.likes.find_by(user: current_user)
    if like
      like.destroy
      redirect_to post_path(@comment.post), notice: 'Comment unliked successfully'
    else
      redirect_to post_path(@comment.post), alert: 'You have not liked this comment.'
    end
  end
end
