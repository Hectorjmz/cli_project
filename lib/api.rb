#handle all of our API request 

class API

    def self.fetch_breweries(brew)
        url = "https://api.openbrewerydb.org/breweries?by_city=#{brew}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        by_city = JSON.parse(response)
        by_city.each do |store|
            a = Breweries.new(name: store["name"], id: store["id"], brewerie_type: store["brewery_type"], street: store["street"], city: store["city"], state: store["state"], postal_code: store["postal_code"], country: store["country"], phone: store["phone"], website: store["website"])
        end
    end

    #Here should be placed the methods to get request to the API for different querys 

    

end