class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :destroy ]
  before_action :set_post, only: [ :show, :destroy ]

  def index
    @posts = Post.order(created_at: :desc).page(params[:page])

    if params[:artist_name].present?
      @posts = @posts.where(artist_name: params[:artist_name])
    end

    if params[:song_title].present?
      @posts = @posts.where(song_title: params[:song_title])
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @comments = @post.comments.includes(:user).order(created_at: :desc).page(params[:page])
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user: current_user))

    if @post.save
      redirect_to posts_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def destroy
    if @post.user == current_user
      @post.destroy
      redirect_to posts_path, notice: "投稿を削除しました。"
    end
  end

private

  def post_params
    params.require(:post).permit(:spotify_track_id, :song_title, :artist_name, :content)
  end

  def set_post
    @post =Post.find(params[:id])
  end
end
