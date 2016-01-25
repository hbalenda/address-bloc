# tell ruby to load library entry.rb relative to address_book.rb's file path
require_relative 'entry'

class AddressBook
    attr_accessor :entries
    
    def initialize
        @entries = []
    end
    
    def add_entry(name, phone_number, email)
        # create a variable to store the insertion 'index'
        index = 0
        @entries.each do |entry|
            #compare name with the name of the current entry. if it lexographically proceeds entry.name, we've found the index to insert at. otherwise we increment index and continue comparing with other entries.
            if name < entry.name
                break
            end
            index += 1
        end
        #insert a new entry into entries using the calculated index.
        @entries.insert(index, Entry.new(name, phone_number, email))
    end
    
    def remove_entry(name, phone_number, email)
        item_to_delete = Entry.new(name, phone_number, email)
        @entries.each_with_index do |entry, index|
            if item_to_delete.to_s == entry.to_s
                @entries.delete_at(index)
            end
        end
    end

end