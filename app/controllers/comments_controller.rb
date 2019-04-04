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
        @post = Post.find(params[:post_id])
        if !params[:comment][:username].strip.empty? && !params[:comment][:body].strip.empty?
            @comment = @post.comments.create(comments_params)
            @comment.time = Time.now
        end
        redirect_to posts_path
    end


    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_params
        params.require(:comment).permit( :username, :body)
    end
end
