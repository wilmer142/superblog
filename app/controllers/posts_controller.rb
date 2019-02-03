class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]
  before_action :find_post, :except => [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
