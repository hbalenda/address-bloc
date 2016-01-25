require_relative '../models/entry'
#1 standard first line of an RSpec test file. Says "The file is a spec file and it tests 'Entry'"
RSpec.describe Entry do
    #2 Give the context of the test, in this case, "specs will test Entry attributes".
    describe "attributes" do
        #3 Individual tests separated by 'it' method.
        it "should respond to name" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            #4 each rspec test ends with one or more 'expect' method. If expectations met -> pass. If not -> fail
            expect(entry).to respond_to(:name)
        end
        
        it "should respond to phone number" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry).to respond_to(:phone_number)
        end
        
        it "should respond to email" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry).to respond_to(:email)
        end
    end
    
    describe "#to_s" do
        it "prints an entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
            
            expect(entry.to_s).to eq(expected_string)
        end
    end
end