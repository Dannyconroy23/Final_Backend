class CharactersController < ApplicationController
    
    
    def index
        url = "https://api.disneyapi.dev/characters"
        response = RestClient.get(url)
        render json: response
    end
    
      
end
