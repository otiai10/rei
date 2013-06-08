require 'curses'
include Curses

_stash = puts ARGF.read

init_screen
setpos(0,0)
addstr(_stash) 
refresh
#getch
close_screen
