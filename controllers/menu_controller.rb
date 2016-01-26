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
    puts "4 - Import entries from a CSV"
    puts "5 - Destroy all entries"
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
        read_csv
        main_menu
    when 5
        system "clear"
        destroy_entries
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
      print "Search by name: "
      name = gets.chomp
      match = @address_book.binary_search(name)
      system "clear"
#if match, prints entry.
#if no match, nil is returned from search and no match msg is printed
      if match
        puts match.to_s
        search_submenu(match)
      else
        puts "No match found for #{name}"
      end
    end

    def read_csv
      print "Enter CSV file to import: "
      file_name = gets.chomp

      if file_name.empty?
        system "clear"
        puts "No CSV file read"
        main_menu
      end
#begin protects the program from crashing if an exception is thrown.
      begin
        entry_count = @address_book.import_from_csv(file_name).count
        system "clear"
        puts "#{entry_count} new entries added from #{file_name}."
#program picks up here if exception is thrown
      rescue
        puts "#{file_name} is not a valid CSV file. Please enter the name of a valid CSV file."
        read_csv
      end
    end

    def entry_submenu(entry)
        #display submenu options
        puts "\nn - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"

        #chomp removes whitespace
        selection = gets.chomp

        case selection
            #when the user asks to see the next entry, we can do nothing and control will be returned to view_all_entries
            when "n"
            when "d"
              delete_entry(entry)
            when "e"
              edit_entry(entry)
              entry_submenu(entry)
            when "m"
                system "clear"
                main_menu
            else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry)
            end
        end

      def delete_entry(entry)
          @address_book.entries.delete(entry)
          puts "#{entry.name} has been deleted"
      end

      def edit_entry(entry)

        print "Updated name: "
        name = gets.chomp
        print "Updated phone number: "
        phone_number = gets.chomp
        print "Updated email: "
        email = gets.chomp

        entry.name = name if !name.empty?
        entry.phone_number = phone_number if !phone_number.empty?
        entry.email = email if !email.empty?
        system "clear"

        puts "Updated entry:"
        puts entry
      end

    def search_submenu(entry)
        puts "\nd - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        selection = gets.chomp
    case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
      end
    end

    def destroy_entries
      @address_book.entries.clear
      puts "Congratulations! You destroyed your address book."
    end
end
