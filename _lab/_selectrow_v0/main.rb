require 'curses'
include Curses

require 'stdio'
stdio = Stdio.new

# stdscrの初期化
init_screen

# cursorの可視性
curs_set(1)

addstr(stdio.get_from_pipe)

# cursorの位置
pos_y = 0
pos_x = 0
setpos(pos_y, pos_x)

# 画面全体を表すウィンドウstdscrの表示を更新
refresh

# これ以降、入力はechoする
echo

ch = ''
while true
=begin
こういうふうに書きたかったんだけど、
これだとパイプで渡したものをgetchで受け取ってしまい
>>>
  main.rb:34:in `chr': bignum too big to convert into `long' (RangeError)
    from main.rb:34
  shell returned 1
<<<
このエラーが出る模様
=end
  ch = getch.chr
  case ch
  when 'q'
    close_screen
    break
  when 'j'
    pos_y += 1
  when 'k'
    pos_y -= 1
  when 'l'
    pos_x += 1
  when 'h'
    pos_x -= 1
  else
    flash
  end
  setpos(pos_y, pos_x)
end

# stdout に dump
puts "Input Character is #{ch}"
