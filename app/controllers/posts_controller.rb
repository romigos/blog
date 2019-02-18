# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 2)
  end

  def new
    @post = Post.new
  end

  def edit;
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Статья успешно создана'
    else
      render :new, danger: 'Статья не создана'
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Статья успешно обновлена'
    else
      render :edit, danger: 'Статья не обновлена'
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path, success: 'Статья успешно удалена'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end
end
