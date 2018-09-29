module Crud

  ApplicationController::before_action :"require_api_key!"
  ApplicationController::before_action :set_resource, only: %i[show update destroy]
  
  # GET /apiv2/entity
  def index
    render json: self.class::RESOURCE_CLASS.all
  end

  # POST /apiv2/entity
  def create
    @resource = self.class::RESOURCE_CLASS.new(resource_params)

    if @resource.save
      render json: @resource, status: :created, location: @resource.as_json
    else
      respond_unprocessable @resource.errors
    end
  end

  # GET /apiv2/entity/id
  def show
    render json: @resource.as_json
  end

  # PATCH/PUT /apiv2/entity/1
  def update
    if @resource.update(resource_params)
      render json: @resource.as_json
    else
      respond_unprocessable @resource.errors
    end
  end

  # DELETE /apiv2/entity/1
  def destroy
    @resource.destroy
  end

  protected

  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = self.class::RESOURCE_CLASS.find_by(id: params[:id])
    respond_not_found if @resource.blank?
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.permit!
  end
end
