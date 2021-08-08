# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :load_user

  def index
 @posts = @user.Post.all
  end

  def show
  @post = @user.Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      redirect_to user_post_path(@user, @post), flash: { success: 'Post was added' }
    else
      render :new, flash: { alert: 'Some error occured' }
    end
  end

  def edit
    @post = @user.Post.find(params[:id])
  end

  def update
    @post = @user.Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Photo edited!'
      redirect_to user_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = @user.Post.find(params[:id])
    @post.destroy
    redirect_to action: :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
