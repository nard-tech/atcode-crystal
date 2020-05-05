# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12845051

q = gets.to_i
queries = Array.new(q) { gets.chomp.split(/ /) }

memos = []
string_length = 0
removed = 0

class Memo
  def initialize(c, x, string_length)
    @c = c
    @x = x
    @string_length = string_length
  end

  attr_reader :c, :string_length
  attr_accessor :x

  def process(cs, d2)
    tmp = string_length - d2

    cs[c] ||= 0
    cs[c] += (x - tmp)

    self.x = tmp
  end
end

def find_index(memos, d2)
  (0..(memos.size - 1)).bsearch { |k|
    memo = memos[k]
    memo.string_length > d2
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

    string_length += x
    memos << Memo.new(c, x, string_length)
  else
    d = a.to_i
    d2 = [d + removed, string_length].min

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
