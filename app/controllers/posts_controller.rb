class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  impressionist actions: [:show], unique: [:session_hash]
  # GET /posts
  # GET /posts.json
  def index
    if params[:search]
      @posts = Post.where("active = ?", true).search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
    else
      @posts = Post.where("active = ?", true).order('created_at DESC').page(params[:page]).per(10)
    end

    set_meta_tags :description => "Новости индустрии 3d печати. Статьи собраны и переведены специалистами портала Адаптивные технологии.",
              :keywords => "новости о 3d-печати, развитие 3d-принтеров, статьи об адаптивном производстве, сообщения, статьи, 3d, прототепирование, 3d печать в СМИ"

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    I18n.locale = :ru
    @comment = Comment.new
    impressionist(@post)

    set_meta_tags :title => @post.title,
              :description => @post.description,
              :keywords => @post.keywords,
              :canonical => request.base_url + request.original_fullpath             
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
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
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

  def upvote 
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end  

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end

  def comment_upvote 
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_to :back
  end  

  def comment_downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :user_id, :active, :like, :postimage, :dislike, :pimage, :category_id, :category, :description, :keywords, :author, :project_id)
    end
end
