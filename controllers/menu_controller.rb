require_relative "../models/address_book"

  class MenuController
    attr_accessor :address_book

    def initialize
      @address_book = AddressBook.new
    end

    def main_menu
#This displays menu option to the command line
      puts "Main Menu - #{@address_book.entries.count} entries"
      puts "1 - View all entries"
      puts "2 - Create an entry"
      puts "3 - Search for an entry"
      puts "4 - Import entries from a CSV"
      puts "5 - Exit"

      print " Enter your selection: "
#Retrives user input from the command line using gets, which reads the next line from standard input
      selection = gets.to_i
#creates responses to user input using case statement / creates user experience      
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

        puts "Goodbye!"
# terminates the program. exit(0) terminates without an error. 
        exit(0)

      else 
# use else to catch invalid user inputs.   
        system "clear"
        puts "Sorry, that is not a valid selection."
        main_menu
      end
    end

    def view_all_entries
#iterates through all entries, clears the screen, and then displays them as string using puts    
      @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
# calls entry_submenu to display a submenu for each entry
        entry_submenu(entry)
      end
    end

    def create_entry
#clear the screen before writing prompts to screen      
      system "clear"
      puts " New datAddress Entry"
#uses print to prompt user input for each option
      print "Name: "
      name = gets.chomp
      print "Phone number: "
      phone = gets.chomp
      print "Email: "
      email = gets.chomp
#adds a new entry to @address_block using add_entry function to order it
      @address_book.add_entry(name, phone, email)


      system "clear"
      puts "New entry created."
    end

  

    def search_entries

    end

    def read_csv

    end

    def entry_submenu
     
      puts "n - next entry"
      puts "d - delete entry"
      puts "e - edit this entry"
      puts "m - return to main menu"
#use chomp to remove any trailing whitespaces 'gets' returns
      selection = gets.chomp

      case selection

      when "n"

      when "d"

      when "e"
#returns user to the main menu
      when "m"

        system "clear"
        main_menu
      else

        system "clear"
        puts "#{selection} is not a valid entry."
        entries_submenu(entry)
      end
    end 
  end 
  
