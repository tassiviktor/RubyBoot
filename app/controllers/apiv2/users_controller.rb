class Apiv2::UsersController < ApplicationController
  before_action :set_apiv2_user, only: [:show, :update, :destroy]

  # GET /apiv2/users
  def index
    @apiv2_users = Apiv2::User.all

    render json: @apiv2_users
  end

  # GET /apiv2/users/1
  def show
    render json: @apiv2_user
  end

  # POST /apiv2/users
  def create
    @apiv2_user = Apiv2::User.new(apiv2_user_params)

    if @apiv2_user.save
      render json: @apiv2_user, status: :created, location: @apiv2_user
    else
      render json: @apiv2_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /apiv2/users/1
  def update
    if @apiv2_user.update(apiv2_user_params)
      render json: @apiv2_user
    else
      render json: @apiv2_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /apiv2/users/1
  def destroy
    @apiv2_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apiv2_user
      @apiv2_user = Apiv2::User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def apiv2_user_params
      params.fetch(:apiv2_user, {})
    end
end
