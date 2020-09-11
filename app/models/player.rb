class Player < ApplicationRecord
    has_many :reservations
    has_many :courts, through: :reservations

    has_many :reviews

    has_secure_password

    geocoded_by :address
    after_validation :geocode

    validates :name, :username, :password, :level, :address, :email, presence: true
    validates :username, :email, uniqueness: true


    def self.player_level(player_level)
        Player.where("level like ?", "%#{player_level}%")
    end


    # def self.level_1
    #     Player.where("level like ?", "%1.0%")
    # end 

    # def self.level_2
    #     Player.where("level like ?", "%2.0%")
    # end 

    # def self.level_2_5
    #     Player.where("level like ?", "%2.5%")
    # end 

    # def self.level_3
    #     Player.where("level like ?", "%3.0%")
    # end 

    # def self.level_3_5
    #     Player.where("level like ?", "%3.5%")
    # end 

    # def self.level_4
    #     Player.where("level like ?", "%4.0%")
    # end 

    # def self.level_4_5
    #     Player.where("level like ?", "%4.5%")
    # end 

    # def self.level_5
    #     Player.where("level like ?", "%5.0%")
    # end 

end
