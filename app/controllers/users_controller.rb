class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
#    @users = User.order('users.last_sign_in_at DESC').page(params[:page]).per(12)

    if params[:search]
      @users = User.search(params[:search]).order(sort_column + ' ' + sort_direction).page(params[:page]).per(12)
    else
      @users = User.order(sort_column + ' ' + sort_direction).page(params[:page]).per(12)
    end

  end

  def messages

  end

  # GET /users/1
  # GET /users/1.json
  def show
		@posts = @user.posts
        @models = @user.models
        @comments = @user.comments

      	items = (@posts.to_a + @models.to_a + @comments.to_a)
        
      	items = items.sort_by { |obj| obj.created_at }.reverse
        @items = items.take(12)

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:title, :description, :cimage, :city)
    end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_sign_in_at"
  end
  
  def sort_direction
      %w[desc asc].include?(params[:direction]) ?  params[:direction] : "desc"
  end  
end
