class Api::V1::PropertiesController < ApplicationController
  def index
    facade = PropertiesFacade.new
    properties = facade.oompr_search(params[:city])
    render json: properties
  end
end