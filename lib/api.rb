#handle all of our API request 

class API

    def self.fetch_breweries(brew)
        url = "https://api.openbrewerydb.org/breweries?by_city=#{brew}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        by_city = JSON.parse(response)
        by_city.each do |store|
            a = Breweries.new(name: store["name"], id: store["id"])
        end
    end

end