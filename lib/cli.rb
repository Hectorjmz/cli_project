#interaction with user
#contain all of our gets and puts
#control flow of our program

class CLI

    def start
        main_menu
        input = gets.strip.downcase
        while input != 'exit' do
            puts "Input the city you are interested in find some brewing stores (type 'exit' to exit)"
            input = gets.strip.downcase
            if input == 'exit'
                break
            end
            API.fetch_breweries(input)
            stores = Breweries.all
            print_stores(stores)
            puts ""
            puts "If you want more info of any showed brewery, type its number (type 'exit' to exit)"
            input = gets.strip
            if input == 'exit'
                break
            else
                input = input.to_i
                if input > 0 
                    print_info_store(input)
                end
            end 
            Breweries.clear    
            puts "Press any key to continue searching (type 'exit' to exit)"
            input = gets.strip.downcase
        end
        goodbye

    end

    def main_menu
        puts ""
        puts "WELCOME TO BREWERIY FINDER"
        puts ""
        puts "This program help you to find Breweries based in location"
        puts "Type any key to continue (type 'exit' to exit)"
        # puts "Type 'type' if you want to acces to the type manu (type 'exit' to exit)"
    end

    def print_stores(stores)
        stores.each.with_index(1) do |store, i|
            puts "#{i}) #{store.name}"
        end
    end

    def print_info_store(index)
        brew =  Breweries.all[index-1]
        puts ""
        puts "Name:  #{brew.name}"
        puts "Id:  #{brew.id}"
        puts "Brewerie_type:  #{brew.brewerie_type}"
        puts "Street:  #{brew.street}"
        puts "City:  #{brew.city}"
        puts "State:  #{brew.state}"
        puts "Postal_code:  #{brew.postal_code}"
        puts "Country:  #{brew.country}"
        puts "Phone:  #{brew.phone}"
        puts "Website:  #{brew.website}"
        puts "-----------------------------------------------------"
        puts ""
    end

    def goodbye
        puts "Goodbye.....maybe some funnt quotes"
    end

end