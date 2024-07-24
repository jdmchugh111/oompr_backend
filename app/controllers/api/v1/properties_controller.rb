class Api::V1::PropertiesController < ApplicationController
  def index
    facade = PropertiesFacade.new
    facade.oompr_search(params[:city])
  end
end