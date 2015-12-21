require_relative '../models/address_book.rb'

  RSpec.describe AddressBook do

      let(:book) { AddressBook.new }
      
      def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
      end

    context "attributes" do
      it "should respond to entries" do
       expect(book).to respond_to(:entries)
      end
     
      it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
      end

      it "should initialize entries as empty" do
     expect(book.entries.size).to eq 0
      end

    end
      
    context "#add_entry" do
      it "adds one entry to the address book" do
       book.add_entry('Chris Bradford', '488.444.4444', 'chris@datAddress.com')
        new_entry = book.entries[0]

        expect(new_entry.name).to eq 'Chris Bradford'
        expect(new_entry.phone_number).to eq '488.444.4444'
        expect(new_entry.email).to eq 'chris@datAddress.com'
      end
    end

    context "#remove_entry" do
      it "removes an entry from address book" do 
       book.add_entry('Chris Bradford', '488.444.4444', 'chris@datAddress.com')
        
        name = 'Chris Daniel'
        phone_number = '588.555.5555'
        email = 'cdaniel@datAddress.com'
        book.add_entry(name, phone_number, email) 

        expect(book.entries.size).to eq 2
        book.remove_entry(name, phone_number, email)
        expect(book.entries.size).to eq 1
        expect(book.entries.first.name).to eq('Chris Bradford')
      end
    end

    context ".import_from_csv" do
      it "imports the correct number of entries from csv file" do

        book.import_from_csv("/home/christopher/datAddress/models/entries.csv")
        book_size = book.entries.length

        expect(book_size).to eql 2  
      end
      it "imports the 1st entry" do 

        book.import_from_csv("/home/christopher/datAddress/models/entries.csv")
        #Check the first entry
        entry_one = book.entries[0]
        check_entry(entry_one, "Bill","555-555-5555", "bill@samplemail.com")
      end      
     it "imports the 2nd entry" do

       book.import_from_csv("/home/christopher/datAddress/models/entries.csv")
       #check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Jill","444-444-4444", "jill@samplemail.com")
     end 
    end

    context "#binary_search" do
      it "searches datAddress for a non-existent entry" do
        book.import_from_csv("entries.csv")
        entry = book.binary_search("Dan")
        expect(entry).to be_nil
      end

      it "searches datAddress for Bill" do
        book.import_from_csv("entries.csv")
        entry = book.binary_search("Bill")
        expect(entry).to be_a Entry
        check_entry(entry, "Bill", "555-555-5555", "bill@samplemail.com")
      end
    end
    
    context "#iterative_search" do 
      it "Searched datAddress for a non-existent entry using iteration" do
        book.import_from_csv("/home/christopher/datAddress/models/entries.csv")
        entry = book.iterative_search("Rich")
        expect(entry).to be_nil
      end
    end  


 end


