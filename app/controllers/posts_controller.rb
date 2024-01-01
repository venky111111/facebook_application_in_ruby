class PostsController < ApplicationController
  before_action :authenticate_user!
  def index 
    @posts=Post.all
    @comment_counts = {}  
    @likes_counts={}
    
    @posts.each do |post|
      @comment_counts[post.id] = post.postcomments.count
      @likes_counts[post.id] = post.likes.count
    end
   
  end
  def show
    @post = Post.find(params[:id])
   
    @comments = @post.postcomments.includes(:user)
    @comment_likes_counts = {}

    # Iterate through each comment and get the like counts for that comment
    @comments.each do |comment|
      @comment_likes_counts[comment.id] = comment.likes.count
    end
    
  end
  def destroy
    @post = Post.find(params[:id])
  
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path, notice: 'Post was successfully deleted.'
    else
      redirect_to posts_path, alert: 'You are not authorized to delete this post.'
    end
  end

 



  def new
    @post = Post.new 
  end
  def create
    @post = current_user.post.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render 'new'
    end
  end
  private

  def post_params
    params.require(:post).permit(:content)
  end
  def comment
    @post = Post.find(params[:id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to @post, notice: 'Comment added!'
    else

      render 'show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
 



end
