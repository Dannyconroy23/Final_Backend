class FavoritesController < ApplicationController

    def index
      render json: Favorite.all, status: :ok
    end
  
    def show
        favorite = Favorite.find(params[:id])
      render json: favorite, status: :ok
    end
  
    def create
        render json: Favorite.create!(favorite_params), status: :created
    end
  
    def update
        favorite = Favorite.find(params[:id])
      render json: favorite.update!(favorite_params), status: :created
    end
  
    # def destroy
    #     favorite = Favorite.find(params[:id])
    #     favorite.destroy
    #   head :no_content
    # end
  
    # def user_favorites
    #   current_user_favorite = Favorite.joins(:user).where(:user => {:id => params[:id]})
    #   render json: current_user_favorite
    # end
  
    private
  
    def favorite_params
      params.permit( :user_id, :character_id, :imageUrl, :_id)
    end
  
  end
