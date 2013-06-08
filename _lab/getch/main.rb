require 'curses'
include Curses

init_screen
setpos(0,0)
addstr("Give Me Some Input!!\n\n and I will judge that.") 
refresh
ch = getch.chr

# close してから...
close_screen

# stdout に dump
puts "Input Character is #{ch}"
