require 'mondai'
require 'mondaiwind'
require 'curses'
include Curses

init_screen
cbreak

begin
  puts "問題作成中..."
  m = Mondai.new
  mondai = m.make

  mon_win = MondaiWind.new(stdscr)
  mon_win.display(mondai)

  max_input = mondai.length * 2
  max_input.times do
    if m.all_collect?
      mon_win.seikai
      break
    end
    input_str = getch.chr
    addstr(input_str)
    if index = m.check(input_str)
      mon_win.turn_up(input_str,  index)
    end
  end
  getch
ensure
  close_screen
  puts "answer=>#{mondai}"
  exec('vim hoge.txt')
end
