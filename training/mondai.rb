require 'rubygems'

class Mondai
  def make
    mondaibun = get_from_remote
    @mondai = mondaibun.split(//)
    @collect_num = 0
    return mondaibun
  end

  def check(input_c)
    pos = @mondai.index(input_c)
    if pos
      @mondai[pos] = ""
      @collect_num += 1
    end

    return pos
  end

  def all_collect?
    return (@collect_num >= @mondai.length)
  end

  private

  def get_from_remote
    #doc = Hpricot(open("http://delicious/tag/"))
    #arr = doc.search("div.alphacloud a")
    arr = ['abc','def','ghi','jkl']
    return arr[rand(arr.size-1)]
  end
end
