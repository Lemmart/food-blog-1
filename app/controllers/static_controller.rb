class StaticController < ApplicationController
    def show
        @user = current_user.username
        @comments = Comment.all.where("username == ?", @user)
        @posts = Post.all.where("username == ?", @user)
        render params[:page]
    end
end
