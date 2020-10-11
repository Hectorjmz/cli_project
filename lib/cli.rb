#interaction with user
#contain all of our gets and puts
#control flow of our program

class CLI

    def start
        main_menu
        input = gets.strip.downcase
        while input != 'exit' do
            puts ""
            puts "Input the city you are interested in finding a brewery (type 'exit' to exit)"
            puts ""
            input = gets.strip.downcase
            puts ""
            if input == 'exit'
                break
            end
            API.fetch_breweries(input)
            stores = Breweries.all
            print_stores(stores)
            puts ""
            puts "Enter the number of the option you would like more information (type 'exit' to exit)"
            puts ""
            input = gets.strip.downcase
            if input == 'exit'
                break
            elsif (input.to_i > 0 && input.to_i <= Breweries.all.length)
                input = input.to_i
                if input > 0 
                    print_info_store(input)
                end
            else
                puts "That input is not avaliable"
                puts ""
            end 
            Breweries.clear    
            puts "Press any key to continue searching (type 'exit' to exit)"
            input = gets.strip.downcase
        end
        puts ""
        goodbye
        puts ""

    end

    def main_menu
        puts ""  
        puts "W E L C O M E   T O   B R E W E R Y   F I N D E R".colorize(:color => :yellow, :background => :black)
        puts "-------------------------------------------------".colorize(:color => :yellow, :background => :black)
        puts ""
        puts "This program helps you to find Breweries based on location"
        puts ""
        puts "Type any key to continue (type 'exit' to exit)"
    end

    def print_stores(stores)
        if stores.length > 0
            stores.each.with_index(1) do |store, i|
                puts "#{i}) #{store.name}"
            end
        else
            puts "We don't have any option there"
        end
    end

    def print_info_store(index)
        brew =  Breweries.all[index-1]
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:yellow)
        puts "Name:  #{brew.name}"
        puts "Address:  #{brew.street}"
        puts "City:  #{brew.city}"
        puts "Phone:  #{brew.phone}"
        puts "Website:  #{brew.website}"
        puts "Brewerie_type:  #{brew.brewerie_type}"
        puts "State:  #{brew.state}"
        puts "Postal_code:  #{brew.postal_code}"
        puts "Country:  #{brew.country}"
        puts "Id:  #{brew.id}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:yellow)
        puts ""
    end

    def goodbye
        quotes_array = [
            "“A designated driver helps you party another day.”",
            "“A tree never hits an automobile except in self defense.” » American Proverb",
            "“Allow Life To Thrive, Don’t Drink And Drive.” Slogansmotto",
            "“Been To The Bash? Please Don’t Crash!”",
            "“Better To Arrive Sober And Late Than Never.”",
            "“Buzzed driving is drunk driving.”",
            "“Don’t Drink And Drive, And You’ll Stay Alive.”",
            "“Drink and drive, the police will show you some new bars.”",
            "“Drink+Drive = Deadly Cocktail”",
            "“Drink, Drunk, Drive, Dead”",
            "“Drinking + Driving = Disaster”",
            "“Drinking And Driving Is A Gamble That You Just Can’t Win.”",
            "“Drive hammered, get slammered.”",
            "“Drunk driving is a killer disease.”",
            "“Friends Don’t Let Friends Drive Drunk.”",
            "“Honk if you love Jesus. Text while driving if you want to meet him.”",
            "“If Partying Is A Must, Designate A Driver That You Trust.”",
            "“If You Drink And Drive, You’re Going To Make Someone Cry.”",
            "“If you drink, don’t drive. Don’t even putt.” » Dean Martin",
            "“If you must drink and drive, drink Pepsi.” » Bumper sticker"
        ]

        puts quotes_array.sample.colorize(:blue)
        
    end

end