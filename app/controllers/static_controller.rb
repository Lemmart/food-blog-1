class StaticController < ApplicationController
    def show
        @user = current_user
        @comments = Comment.joins(:user).where("user_id == ?", @user.id)
        @posts = Post.joins(:user).where("user_id == ?", @user.id)
        render params[:page]
    end
end
