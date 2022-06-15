class User < ApplicationRecord
    has_many :favorites
    has_many :characters, through: :favorites

    has_secure_password
    validates :username, presence: true, uniqueness: true
end
