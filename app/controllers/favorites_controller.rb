class FavoritesController < ApplicationController

    def index
      render json: Favorite.all, status: :ok
    end
  
    def show
        favorite = Favorite.find(params[:id])
      render json: favorite, status: :ok
    end
  
    def create
      character = Character.find_by(id:params[:character_id])  
      if !character.present?
        created_character = Character.create(id: params[:character_id], user_id: params[:user_id], name: params[:char][:name], imageUrl: params[:char][:imageUrl])
      end
      character = Character.find_by(id:params[:character_id])   
      favorite = Favorite.find_by(user_id: params[:user_id], character_id: params[:character_id])
      if !favorite.present?
        favorite = Favorite.create(character_id: params[:character_id], user_id: params[:user_id])
      end
      render json: favorite, status: :created
  end
  
    def update
        favorite = Favorite.find(params[:id])
      render json: favorite.update!(favorite_params), status: :created
    end
  
    def destroy
        favorite = Favorite.find_by(params[:id])
        favorite.destroy
        head :no_content
    end
  
    def user_favorites
      current_user_favorite = current_user.characters
      render json: current_user_favorite
    end
  
    private
  
    def favorite_params
      params.permit( :user_id, :name, :imageUrl)
    end
  
  end
