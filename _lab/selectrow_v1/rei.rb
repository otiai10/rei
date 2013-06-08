require 'curses'
include Curses

def build_command
  command = ''
  ARGV.each do |arg|
    command.concat(" ").concat(arg)
  end
  return command
end
def extract_filename(elms)
  elms.each do |e|
    if e.match(/[\.|\w|\/]*/) && FileTest.exists?(e)
      return e
    end
  end
  return nil
end
def dispatch_keys(ch, pos)
  res = true
  case ch
  when 'e', "\n"
    res = false
  when 'q'
    res = nil
  when 'j'
    pos['y'] += 1
  when 'k'
    pos['y'] -= 1
  when 'l'
    pos['x'] += 1
  when 'h'
    pos['x'] -= 1
  else
    # do nothing
  end
  return res, pos
end
def locate(pos)
  setpos(pos['y'], pos['x'])
end

# Cursesスクリーンを初期化
init_screen
refresh
noecho
# 表示するコンテンツを生成
command_result = `#{build_command}`
rows = command_result.split("\n")
rows.each do |row|
  addstr(row)
  addstr("\n")
end
# カーソルの位置
pos = {'y' => 0,'x' => 0}
locate(pos)
curs_set(1)
# 画面全体を表すウィンドウstdscrの表示を更新
res = true
while res
  res, pos = dispatch_keys(getch.chr, pos)
  locate(pos)
end
# Cursesスクリーンを終了
close_screen

# 有効なファイルを選定してエディタを起動
if res.nil?
  exit
else
  unless rows[pos['y']].nil?
    elements = rows[pos['y']].split(/[\n|\t|\b|\r|\s|:]/)
    if file_name = extract_filename(elements)
      exec('vim '.concat(file_name))
      return 0
    end
  end
end

puts "This row doesn't include valid filename => #{rows[pos['y']]}"
