require 'curses'
include Curses

# stdscrの初期化
init_screen

# cursorの可視性
curs_set(1)

# 表示文字列を追加
addstr("Give Me Some Input!!\n\n and I will judge that.") 

# cursorの位置
pos_y = 0
pos_x = 0
setpos(pos_y, pos_x)

# 画面全体を表すウィンドウstdscrの表示を更新
refresh

# これ以降、入力はechoする
echo

ch = ''
# 入力文字を待ち、取得
while true
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
