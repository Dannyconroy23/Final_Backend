class User < ApplicationRecord
    has_many :favorites
    has_many :characters, through: :favorites
    has_secure_password
end
