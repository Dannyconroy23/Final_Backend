class FavoritesController < ApplicationController

    def index
      render json: Favorite.all, status: :ok
    end
  
    def show
        favorite = Favorite.find(params[:id])
      render json: favorite, status: :ok
    end
  
    def create
      created_character = Character.create(id: params[:id], user_id: params[:user_id], name: params[:name], imageUrl: params[:imageUrl])
      character = Character.find_by(id:params[:id])   
      if created_character.save
          render json: character, status: :created
      else
          favorite = Favorite.find_by(user_id: params[:user_id])
          fav =Favorite.create(user_id: params[:user_id])
          render json: favorite, status: :created
      end
  end
  # def create
    
    
    
    # if fav_save.save
    #   render json: fav_save
    # else 
    #   render json: {errors: fav_save.errors.full_messages}
    # else
    #   if char_save.save
    #   render json: char_save
    # else
    #   render json: {errors: char_save.errors.full_messages}
    # end
  # end
 
  
    
  
    def update
        favorite = Favorite.find(params[:id])
      render json: favorite.update!(favorite_params), status: :created
    end
  
    def destroy
        favorite = Favorite.find(params[:id])
        favorite.destroy
      head :no_content
    end
  
    def user_favorites
      current_user_favorite = Favorite.joins(:user).where(:user => {:id => params[:id]})
      render json: current_user_favorite
    end
  
    private
  
    def favorite_params
      params.permit( :user_id, :name, :imageUrl)
    end
  
  end
