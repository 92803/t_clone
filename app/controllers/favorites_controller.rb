class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(coment_id: params[:coment_id])
    redirect_to coments_url, notice: "#{@favorite.coment.user.name}さんのComent!>favorite!!"
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to coments_url, notice: "#{@favorite.coment.user.name}さんのComent!>remove favorite."
  end
end
