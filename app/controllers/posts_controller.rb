class PostsController < ApplicationController

  before_action(:logged_in_user?, only: [:new, :create])

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Post added'
      redirect_to posts_path
    else
      flash[:danger] = 'Cannot add post'
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def logged_in_user?
    unless logged_in?
      flash[:danger] = 'Please sign in'
      redirect_to sign_in_path
    end
  end

  def post_params
    params.require(:post).permit([:title, :content])
  end

end
