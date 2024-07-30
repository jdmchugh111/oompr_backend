class Api::V1::FavoritesController < ApplicationController

  def create
    facade = FavoritesFacade.new
    if params[:user].present? && params[:listing].present?
      favorite = facade.create_favorite(params[:user], params[:listing])
      render json: FavoriteSerializer.new(favorite)
    else
      render json: ErrorSerializer.new(ErrorMessage.new("Params missing", 400)).serialize_json, status: :bad_request
    end
  end

  def index
    favorites = Favorite.get_all_favorites(params[:user])
    render json: FavoriteSerializer.new(favorites)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
  end
end