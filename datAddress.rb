require_relative "controllers/menu_controller"

#create new menucontroller
  menu = MenuController.new
#use system "clear" to clear the command line
  system "clear"

  puts "Welcome to datAddress, y'all!"
#calls main_menu function to display the menu
  menu.main_menu
