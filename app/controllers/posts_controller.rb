class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  # GET /posts
  # GET /posts.json
  def index
    @user = current_user
    i_params = index_params
    # Search term entered
    if !i_params[:search].nil?
      tag_ids = []
      Post.all.each do |p|
          if p.tags.include? i_params[:search]
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
    # Filter button clicked
    elsif !i_params[:button_tag].nil?
      # button filtering
      @posts = helpers.filter(i_params[:button_tag])
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user = current_user
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
    @post = Post.new(post_params)
    @post.user = current_user
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
    @user = current_user
    @post.user = current_user

    respond_to do |format|
      if @post.update(post_params)
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
    
    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
    
    def post_params
      params.require(:post).permit(:caption, :rating, :location, :time, :tags, :image_url)
    end
    
    def index_params
      params.permit(:caption, :rating, :location, :time, :tags, :image, :search, :button_tag)
    end
end
