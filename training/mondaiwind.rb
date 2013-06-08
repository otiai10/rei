require "curses"

class MondaiWind
  def initialize(main_wind)
    max_y = main_wind.maxy
    max_x = main_wind.maxx

    @window = main_wind.subwin(max_y - 3, max_x, 0 , 0)

    @window.box(?|, ?-, ?*)

    main_wind.setpos(@window.maxy, 0)
    main_wind.addstr("input=>")
  end

  def display(mondai_str)
    @mondai_str = mondai_str
    @mondai_y = @window.maxy/2
    @mondai_x = (@window.maxx/2) - (mondai_str.length/2)

    @window.setpos(@mondai_y, @mondai_x)

    @window.addstr("_" * @mondai_str.length)
    @window.refresh
  end

  def turn_up(moji_str, index)
    @window.setpos(@mondai_y, @mondai_x + index)
    @window.addstr(moji_str)
    @window.refresh
  end

  def seikai
    @window.setpos(@mondai_y + 1, @mondai_x)
    @window.addstr("正解")
    @window.refresh
  end
end
