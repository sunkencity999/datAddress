require_relative '../models/address_book.rb'

  RSpec.describe AddressBook do
    context "attributes" do
      it "should respond to entries" do
        book = AddressBook.new
        expect(book).to respond_to(:entries)
      end
     
      it "should initialize entries as an array" do
       book = AddressBook.new
       expect(book.entries).to be_a(Array)
      end

      it "should initialize entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq 0
      end

    end
      
    context "#add_entry" do
      it "adds one entry to the address book" do
        book = AddressBook.new
        book.add_entry('Chris Bradford', '488.444.4444', 'chris@datAddress.com')
        new_entry = book.entries[0]

        expect(new_entry.name).to eq 'Chris Bradford'
        expect(new_entry.phone_number).to eq '488.444.4444'
        expect(new_entry.email).to eq 'chris@datAddress.com'
      end
    end

    context "#remove_entry" do
      it "removes an entry from address book" do 
        book = AddressBook.new
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
   end


