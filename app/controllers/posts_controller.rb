class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    s_params = search_params
    if !s_params[:search].nil?
      tag_ids = []

      Post.all.each do |p|
        if p.tags.include? s_params[:search]
          tag_ids.append(p.id)
        end
      end
      if tag_ids.empty?
        flash[:warning] = 'No results found.'
      end

      
      if !tag_ids.blank?
        @posts = Post.where(:id => tag_ids).order('created_at DESC')
      else
        # redirect to a "no results found" page/text block
        @posts = Post.all.order('created_at DESC')
      end
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    id = params[:id]
    @post = Post.find(id) 
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = current_user
    values = {}
    values = post_params.clone
    values[:user_id] = current_user.id
    @post = Post.new(values)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      # find @post by :id passed in to params!!!
      # @post = Post.find()
      values = {}
      values = post_params.clone
      values[:user_id] = current_user.id
      if @post.update(values)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:caption, :rating, :location, :time, :tags, :image)
    end

    def search_params
      params.permit(:caption, :rating, :location, :time, :tags, :image, :search)
    end
end
