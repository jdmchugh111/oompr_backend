class Api::V1::PropertiesController < ApplicationController

rescue_from NoMethodError, with: :bad_request_error

  def index
    facade = PropertiesFacade.new
    if params[:monthly].present?
      maxprice = facade.get_max(params[:monthly])
      properties = facade.rc_search(params[:city], maxprice)
      render json: ListingSerializer.new(properties)
    else
      properties = facade.oompr_search(params[:city])
      render json: ListingSerializer.new(properties)
    end
  end
  
  def show
    facade = PropertiesFacade.new
    listing = facade.get_listing(params[:id])
    render json: ListingSerializer.new(listing)
  end

  private

    def bad_request_error(exception)
      render json: ErrorSerializer.new(ErrorMessage.new("Resource not found", 404)).serialize_json, status: :not_found
    end
end