class PostsController < ApplicationController
  def new
    @post = Post.new

    @user_list = User.all.map do |user|
      [ user.name, user.id ]
    end
    render :new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to user_path(@post.user)
    else
      render :new
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(params[:post])
     redirect_to action: :show
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end
def edit
    @post = Post.find(params[:id])
    render :edit
end
end