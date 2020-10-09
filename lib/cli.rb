#interaction with user
#contain all of our gets and puts
#control flow of our program

class CLI

    def start
        puts "Etoy vivo desde CLI start"
        puts "Welcome to Breweries finder"
        puts "Select the city you are interested in find some brewing stores"
        @menu_select = gets.strip.downcase
        puts ""
        API.fetch_breweries(@menu_select)
        stores = Breweries.all
        print_stores(stores)
        puts "Type the number of a store to have more details or type 'exit' to exit"
        #binding.pry
    end

    def print_stores(stores)
        stores.each.with_index(1) do |store, i|
            puts "#{i}) #{store.name}"
        end
    end

end