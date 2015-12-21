require_relative "entry.rb" 
#loads library named 'entry.rb' relative to address_book.rb 
require "csv"

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
    
    def binary_search(name)
      lower = 0
 #this saves the index at the leftmost of the array in a variable    
      upper = entries.length - 1
# this saves the index at the rightmost of the array in a variable by using the .length operator to 
#get the length of the entire array, and then subtracting 1 to give the number of the rightmost entry. An array of 5 items would count 
# [0,1,2,3,4] 0 is the first entry, and 4 the last. Subtracting 1 from the total will always give the rightmost item's position
#in the array. 

      while lower <= upper
        mid = (lower + upper) / 2
        mid_name = entries[mid].name
# this finds the middle index by taking the sum of the first and last index, and dividing that by 2. Ruby truncates decimals.  We then
# retrieve the name of the middle index entry and store it in mid_name.
        if name == mid_name
          return entries[mid]
        elsif name < mid_name
          upper = mid - 1
        elsif name > mid_name
        lower = mid + 1
        end
      end
# this compares the 'name' we are searching for to the name of the middle index 'mid_name. Using the == operator makes the search 
# case sensitive. If name is == to mid_name, we've found our entry and return that entry. If name is alphabetically before mid_name
# we set upper to mid-1, as the name must be in the lower half of the array. If name is alphabetically after mid_name, we set lower
# to mid + 1 as it must be in the upper half of the array.       
      return nil 
# if we don't find it in either the upper or lower half, we return nil, as it doesn't exist. 
    end 
    
    def iterative_search(name)
      entries.each do |entry|
        if entry.name == name
          return entry 
        elsif entry.name != name
          return nil
        end
      end
    end 
end



