require "curses"
include Curses

init_screen
begin
  win = stdscr.subwin(5,30,2,2)
  win.box(?|,?-,?*)
  win.setpos(20,100)
  win.addstr('this is sub window')
  win.refresh
  getch
ensure
  close_screen
end
