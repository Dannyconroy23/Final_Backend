class CharactersController < ApplicationController
    
    
    def index
        url = "https://api.disneyapi.dev/characters"
        response = RestClient.get(url)
        render json: response
    end

    
     def show
            character = Character.find_by(id: params[:id])
            render json: character, status: :ok
    end

    def create
        character = Character.create!(character_params)
        render json: character
    end

    



    
  

   

    

    
    
      
end
