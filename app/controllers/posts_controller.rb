class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]
  before_action :find_post, :except => [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post[:user_id] = current_user[:id]
    if @post.save
      flash[:success] = "Post creado exitosamente!"
      redirect_to posts_path    
    else
      flash[:danger] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post modificado exitosamente!"
      redirect_to posts_path
    else
      flash[:danger] = "No se pudo modificar el post"
      render :edit
    end
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
