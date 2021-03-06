class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [ :index, :show ]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at ASC").sort_by(&:score).reverse
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.order("comments.created_at ASC").sort_by(&:score).reverse
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user if current_user

    respond_to do |format|
      if @post.save
        flash[:success] = "#{@post.title} created!"
        format.html { redirect_to root_path}
        format.json { render :show, status: :created, location: @post }
      else
        flash[:danger] = "Failed to save"
        format.html { redirect_to root_path}
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = "Post updated"
        format.html { redirect_to @post}
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
    flash[:danger] = "Post removed!"
    respond_to do |format|
      format.html { redirect_to root_path }
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
      params.require(:post).permit(:title, :body, :link, :img_url, :user_id, category_ids: [])
    end
end
