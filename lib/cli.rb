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
            elsif (input.to_i > 0 && input.to_i <= Breweries.all.length)
                input = input.to_i
                    if input > 0 
                        print_info_store(input)
                    end
            else
                puts "That input is not avaliable"
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
        puts "WELCOME TO BREWERIY FINDER.."
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
        quotes_array = [
            "“A designated driver helps you party another day.”",
            "“A tree never hits an automobile except in self defense.” » American Proverb",
            "“Allow Life To Thrive, Don’t Drink And Drive.” Slogansmotto",
            "“Automobiles are not ferocious…. it is man who is to be feared. ” » Robbins B. Stoeckel",
            "“Been To The Bash? Please Don’t Crash!”",
            "“Better To Arrive Sober And Late Than Never.”",
            "“Buzzed driving is drunk driving.”",
            "“Don’t Drink And Drive, And You’ll Stay Alive.”",
            "“Drink and drive, the police will show you some new bars.”",
            "“Drink+Drive = Deadly Cocktail”",
            "“Drink, Drunk, Drive, Dead”",
            "“Drinking + Driving = Disaster”",
            "“Drinking And Driving Is A Gamble That You Just Can’t Win.”",
            "“Drinking And Driving – There Are Stupider Things, But It’S A Very Short List”",
            "“Drive hammered, get slammered.”",
            "“Driving Hammered Will Get You Nailed”",
            "“Drunk driving is a killer disease.”",
            "“Friends Don’t Let Friends Drive Drunk.”",
            "“Honk if you love Jesus. Text while driving if you want to meet him.”, as seen on a church sign",
            "“If Partying Is A Must, Designate A Driver That You Trust.”",
            "“If You Drink And Drive, You’re Going To Make Someone Cry.”",
            "“If you drink, don’t drive. Don’t even putt.” » Dean Martin",
            "“If you must drink and drive, drink Pepsi.” » Bumper sticker"
        ]

        puts quotes_array.sample
        
    end

end