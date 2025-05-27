class MypagesController < ApplicationController
  before_action :authenticate_user!
    def show
      @user = current_user

      case params[:tab]
      when "likes"
        @liked_posts = current_user.liked_posts.order(created_at: :desc)
      when "posts"
        @my_posts = current_user.posts.order(created_at: :desc)
      end
    end
end
