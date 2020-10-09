#keep track of our drinks
#turn our responses into objects
#save all drinks created

class Breweries
    attr_accessor :name, :id
    @@all = []

    def initialize(name:, id:)
        @name = name
        @id = id
        @@all << self
    end

    def self.all
        @@all
    end



end