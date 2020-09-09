class Player < ApplicationRecord
    has_many :reservations
    has_many :courts, through: :reservations

    has_many :followed_players, foreign_key: :follower_id, class_name: "Friendship"
    has_many :followee, through: :followed_players

    has_many :following_players, foreign_key: :followee_id, class_name: 'Friendship'
    has_many :followers, through: :following_players

    has_many :reviews

    has_secure_password

    geocoded_by :address
    after_validation :geocode
end
