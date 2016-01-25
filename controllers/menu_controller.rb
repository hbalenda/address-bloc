require_relative '../models/address_book'

class MenuController
    attr_accessor :address_book

    def initialize
        @address_book = AddressBook.new
    end

    def main_menu

    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - View entry Number n"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    #use a 'case' statement operator to determine proper response to user input
    case selection
    when 1
        system "clear"
        view_all_entries
        main_menu
    when 2
        system "clear"
        create_entry
        main_menu
    when 3
        system "clear"
        search_entries
        main_menu
    when 4
        system "clear"
        view_entry_n
        main_menu
    when 5
        system "clear"
        read_csv
        main_menu
    when 6
        puts "Good-bye!"
        #terminate program using exit(0), the zero signifies that it is exiting without error.
        exit(0)
        #use else to catch invalid input and prompt for retry
    else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
        end
    end
    #stubbing the rest of the methods called in main_menu
    def view_all_entries
        #iterates through AddressBook
        @address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            # displays submenu for each entry
            entry_submenu(entry)
        end
        
        system "clear"
        puts "End of entries"
    end
    
    def create_entry
        #clear screen before displaying the create entry prompts
        system "clear"
        puts "New AddressBloc Entry"
        #use print to prompt user for input
        print "Name: "
        name = gets.chomp
        print "Phone Number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        #add new entry to addres book using add_entry, which indexes entry in lexographical order
        @address_book.add_entry(name, phone, email)
        
        system "clear"
        puts "New entry created"
    end
    
    def search_entries
    end
    
    def view_entry_n
        puts "Which entry number? "
        n = gets.chomp.to_i
        if @address_book.entries[n]
        system "clear"
        puts "Entry #{n} is:\n#{@address_book.entries[n]}\n\n"
        else
        puts "#{n} is not a valid input"
        view_entry_n
        end
    end
    
    def read_csv
    end
    
    def entry_submenu(entry)
        #display submenu options
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        
        #chomp removes whitespace
        selection = gets.chomp
        
        case selection
            #when the user asks to see the next entry, we can do nothing and control will be returned to view_all_entries
            when "n"
            when "d"
            when "e"
            when "m"
                system "clear"
                main_menu
            else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry)
            end
        end
end