require "curses"
include Curses

stdin = ARGF.read

init_screen
begin
  setpos(50,20)
  addstr(stdin)
  refresh
  getch
ensure
  close_screen
end
