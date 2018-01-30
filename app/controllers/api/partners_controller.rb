class Api::PartnersController < ApplicationController
  before_action :set_api_partner, only: [:show, :update, :destroy]

  # GET /api/partners
  def index
    @api_partners = Api::Partner.all

    render json: @api_partners
  end

  # GET /api/partners/1
  def show
    render json: @api_partner
  end

  # POST /api/partners
  def create
    @api_partner = Api::Partner.new(api_partner_params)

    if @api_partner.save
      render json: @api_partner, status: :created, location: @api_partner
    else
      render json: @api_partner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/partners/1
  def update
    if @api_partner.update(api_partner_params)
      render json: @api_partner
    else
      render json: @api_partner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/partners/1
  def destroy
    @api_partner.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_partner
      @api_partner = Api::Partner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_partner_params
      params.fetch(:api_partner, {})
    end
end
