class Court < ApplicationRecord
has_many :reservations
has_many :players, through: :courts
accepts_nested_attributes_for :reservations

has_many :reviews

geocoded_by :location
after_validation :geocode, if: -> (obj){!obj.latitude.present? and !obj.longitude.present?}


##methods for sorting by bourough

    
    def self.bronx
        Court.where("prop_id like ?", "%X%")
    end

    def self.brooklyn
        Court.where("prop_id like ?", "%B%")
    end

    def self.manhattan
        Court.where("prop_id like ?", "%M%")
    end

    def self.queens
        Court.where("prop_id like ?", "%Q%")
    end

    def self.staten_island
        Court.where("prop_id like ?", "%R%")
    end

#     def self.search_by_name
# Court.where("name like ?", "%#{params[:name]}%")
#     end
end

