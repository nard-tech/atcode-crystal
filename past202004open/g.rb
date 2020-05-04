# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12833410

q = gets.to_i
queries = Array.new(q) { gets.chomp.split(/ /) }

memos = []
s = 0
removed = 0

class Memo
  def initialize(c, x, l)
    @c = c
    @x = x
    @l = l
  end

  attr_reader :c, :l
  attr_accessor :x

  def process(cs, d2)
    tmp = l - d2

    cs[c] ||= 0
    cs[c] += (x - tmp)

    self.x = tmp
  end
end

def find_index(memos, d2)
  (0..(memos.size - 1)).bsearch { |k|
    memo = memos[k]
    d2 < memo.l
  }
end

def generate_cs(memos, j)
  h = {}

  last_index = j.nil? ? memos.size : j
  memos.slice!(0...last_index).each do |memo|
    c = memo.c
    h[c] ||= 0
    h[c] += memo.x
  end

  h
end

queries.each do |query|
  t, a, b = query

  if t == "1"
    c = a
    x = b.to_i

    s += x
    memos << Memo.new(c, x, s)
  else
    d = a.to_i
    d2 = [d + removed, s].min

    j = find_index(memos, d2)
    cs = generate_cs(memos, j)

    if j
      memo = memos[0]
      memo.process(cs, d2)
    end

    removed += cs.values.reduce(0, :+)

    puts cs.values.reduce(0) { |a, b| a + (b ** 2) }
  end
end
