require_relative '../models/entry.rb'

  RSpec.describe Entry do
  
    context "attributes" do

      it "should respond to name" do
        
         entry = Entry.new('Chris Bradford', '444.429.4555', 'chris@datAddress.com')

         expect(entry).to respond_to(:name)
      end
      it "should respond to phone number" do

        entry = Entry.new('Chris Bradford', '444.429.4555', 'chris@datAddress.com')

        expect(entry).to respond_to(:phone_number)
      end

      it "should respond to email" do 

        entry = Entry.new('Chris Bradford', '444.429.4555', 'chris@datAddress.com')

        expect(entry).to respond_to(:email)
      end
    

    end

    context "#to_s" do
      it "Prints an entry as a string" do
	entry = Entry.new('Chris Bradford', '444.429.4555', 'chris@datAddress.com')
	expected_string = "Name: Chris Bradford\nPhone Number: 444.429.4555\nEmail: chris@datAddress.com"
	
	expect(entry.to_s).to eq(expected_string)
      end
    end	
  end
 


