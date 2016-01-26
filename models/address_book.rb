# tell ruby to load library entry.rb relative to address_book.rb's file path
require_relative 'entry'
require "csv"

class AddressBook
    attr_accessor :entries

    def initialize
        @entries = []
    end

    def add_entry(name, phone_number, email)
        # create a variable to store the insertion 'index'
        index = 0
        @entries.each do |entry|
          #compare name with the name of the current entry. if it lexographically
          #proceeds entry.name, we've found the index to insert at.
          #otherwise we increment index and continue comparing with other entries.
            if name < entry.name
                break
            end
            index += 1
        end
        #insert a new entry into entries using the calculated index.
        @entries.insert(index, Entry.new(name, phone_number, email))
    end

    #Reads the csv file, parses it, saves as 'csv'
    def import_from_csv(file_name)
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    #iterate over CSV::Table object's rows. Each row becomes a hash.
    #convert each row_hash to an entry using add_entry and extracting hash values
    #and adding them to the AddressBook's entries. 
        csv.each do |row|
          row_hash = row.to_hash
          add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end
end
