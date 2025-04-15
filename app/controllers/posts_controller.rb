class PostsController < ApplicationController
  def index
    @posts = Post.all

    if params[:artist_name].present?
      @posts = @posts.where(artist_name: params[:artist_name])
    end

    if params[:song_title].present?
      @posts = @posts.where(song_title: params[:song_title])
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
