class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  # GET /models
  # GET /models.json
  def index
    @models = Model.where("active = ?", true).order('models.created_at DESC').page(params[:page]).per(15)

    if params[:search]
      @models = Model.where("active = ?", true).search(params[:search]).order("models.created_at DESC").page(params[:page]).per(15)
    else
      @models = Model.where("active = ?", true).order('models.created_at DESC').page(params[:page]).per(15)
    end    
  end

  # GET /models/1
  # GET /models/1.json
  def show
    set_meta_tags :title => @model.title,
                  :canonical => request.base_url + request.original_fullpath
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  # POST /models.json
  def create
    @model = current_user.models.build(model_params)

    respond_to do |format|
      if @model.save
        if params[:stls]
          #===== The magic is here ;)
          params[:stls].each { |file|
            @model.stls.create(file: file, user_id: current_user.id)
          }
        end
        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |file|
            @model.images.create(file: file, user_id: current_user.id)
          }
        end        
        format.html { redirect_to @model, notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:title, :description, :files, :stls, :modelimage, :active, :user_id, :like, :dislike)
    end
end
