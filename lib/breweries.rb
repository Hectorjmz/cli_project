
class Breweries
    attr_accessor :name, :id, :brewerie_type, :street, :city, :state, :postal_code, :country, :phone, :website, :all
    @@all = []

    def initialize(name:, id:, brewerie_type:, street:, city:, state:, postal_code:, country:, phone:, website:)
        @name = name
        @id = id
        @brewerie_type = brewerie_type
        @street = street
        @city = city
        @state = state
        @postal_code = postal_code
        @country = country
        @phone = phone
        @website = website

        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all = []
    end

end