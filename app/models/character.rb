class Character < ApplicationRecord
    has_many :users
    has_many :favorites


    def buildNewResponse
        
    end
end
