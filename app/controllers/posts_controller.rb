class PostsController < ApplicationController
  skip_before_action :authorize, only: [:index]

  def index
    @posts = Post.order(created_at: :desc).group_by { |post| post.created_at.strftime("%m/%d/%Y") }.sort.to_h
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first
    tags = params[:tag]
    if @post.save
      create_tags(@post, tags) if tags
      redirect_to root_path
    else
      @posts = Post.order(created_at: :asc).group_by { |post| post.created_at.strftime("%m/%d/%Y") }
      @tags = Tag.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :date)
  end

  def create_tags(post, tags)
    tags.each { |tag| Tag.create(title: tag, post: post)}
  end
end
