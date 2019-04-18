class CommentsController < ApplicationController
    def new
        #@comment = Comment.new
    end
    def index
        # @post = Post.find(params[:post_id])
        # @comment = @post.all
    end
    def show
    end
    def edit
    end
    def create
        @user = current_user
        @post = Post.find(params[:post_id])
        if !params[:comment].empty? && !params[:comment][:body].strip.empty?
            values = {}
            values[:body] = comments_params[:body]
            values[:user_id] = current_user.id
            @comment = @post.comments.create(values)
            @comment.username = @user.username
            @comment.time = Time.now
        end
        redirect_to posts_path
    end


    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_params
        params.require(:comment).permit(:body)
    end
end
