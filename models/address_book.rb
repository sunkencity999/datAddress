require_relative "entry.rb" 
#loads library named 'entry.rb' relative to address_book.rb 

class AddressBook
  attr_accessor :entries 

    def initialize
      
      @entries = []
   
    end

    def add_entry(name, phone, email)
#creating a variable to store the insertion index
      index = 0
      @entries.each do |entry|
#compares 'name' with the name of the current entry. If name lexicographically proceeds entry.name, index to insert at has been found.
        if name < entry.name
          break
        end
#Otherwise, index is incremented and compared to next entry. 
      index += 1
      end
#A new entry is inserted into 'entries' using the calculated 'index'.
      @entries.insert(index, Entry.new(name, phone, email))
    
    end   

    def remove_entry(name, phone, email)
      delete_entry = nil
      
      @entries.each do |entry|
        if name == entry.name && phone == entry.phone_number && email == entry.email
          delete_entry = entry
        end
      end
      @entries.delete(delete_entry)
    end
#this method starts by reading the file using File.read. Uses the CSV class to 'parse' the file, the result of which is an object
#of type CSV::Table.
    def import_from_csv(file_name)
      csv_text = File.read(file_name)
      csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
#here we iterate over each row in the CSV::Table object, create a hash for each row, then use the add_entry method to add it to 
#AdressBook's entries 
      csv.each do |row|
        row_hash = row.to_hash
        add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
      end
    end

  
end



