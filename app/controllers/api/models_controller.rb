class Api::ModelsController < ApplicationController
  before_action :set_model, only: [:show, :update, :destroy]

  # GET /models
  # GET /models.json
  def index
    @models = Model.all

    render json: @models
  end

  # GET /models/1
  # GET /models/1.json
  def show
    render json: @model
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    if @model.save
      render json: @model, status: :created, location: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    if @model.update(model_params)
      head :no_content
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy

    head :no_content
  end

  private

    def set_model
      @model = Model.find(params[:id])
    end

    def model_params
      params.require(:model).permit(:title, :description, :mimage, :active, :user_id)
    end
end
