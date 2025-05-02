class MypagesController < ApplicationController
  before_action :authenticate_user!
    def show
      @user = current_user

      case params[:tab]
      when "likes"
        @liked_posts = current_user.liked_posts
      when "posts"
        @my_posts = current_user.posts
      end
    end
end
