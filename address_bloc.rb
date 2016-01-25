require_relative 'controllers/menu_controller.rb'
#create a new menu controller when AddressBloc starts
menu = MenuController.new
#clears command line
system "clear"
puts "Welcome to AddressBloc!"
# call main_menu to display the menu
menu.main_menu