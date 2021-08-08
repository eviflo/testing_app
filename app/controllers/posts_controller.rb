  class PostsController < ApplicationController
    def index
      @posts = Post.all
    end

    def show
      @post = Post.find(params[:id])
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, flash: { success: 'Post was added' }
      else
        render :new, flash: { alert: 'Some error occured' }
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        flash[:success] = 'Photo edited!'
        redirect_to posts_path
      else
        render 'edit'
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to action: :index
    end

    private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
  end
