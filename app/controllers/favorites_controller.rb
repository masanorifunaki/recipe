class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
    redirect_back(fallback_location: root_path)
    #詳細画面と一覧画面でいいねを押したときに１つ前の画面に戻る

  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)#URLが見つからな買ったらルートパスにいく

  end

end
