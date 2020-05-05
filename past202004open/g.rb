# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12846972

q = gets.to_i
queries = Array.new(q) { gets.chomp.split(/ /) }

memos = []
string_length = 0
active_from = 0

class Type1
  def initialize(char, n_active_chars, to)
    @char = char
    @n_active_chars = n_active_chars
    @to = to
  end

  attr_reader :char, :to
  attr_accessor :n_active_chars

  def process(dict, d_actualy_removed)
    tmp = to - d_actualy_removed
    dict.add(char, n_active_chars - tmp)
    self.n_active_chars = tmp
  end

  def within?(n)
    to <= n
  end
end

class Dictionary
  def self.generate(memos, j)
    dict = new

    last_index = j.nil? ? memos.size : j
    memos.slice!(0...last_index).each do |memo|
      dict.register(memo)
    end

    dict
  end

  def initialize
    @h = {}
  end

  def register(memo)
    char = memo.char
    add(char, memo.n_active_chars)
  end

  def add(char, n)
    @h[char] ||= 0
    @h[char] += n
  end

  def string_length
    @h.values.reduce(0, :+)
  end

  def sum_of_square_index
    @h.values.reduce(0) { |a, b| a + (b ** 2) }
  end
end

queries.each do |query|
  t, a, b = query

  if t == "1"
    char = a
    x = b.to_i

    string_length += x
    memos << Type1.new(char, x, string_length)
  else
    d = a.to_i

    last_position_of_actualy_removed = [d + active_from, string_length].min

    j = memos.bsearch_index { |memo|
      !memo.within?(last_position_of_actualy_removed)
    }
    dict = Dictionary.generate(memos, j)

    if j
      memo = memos[0]
      memo.process(dict, last_position_of_actualy_removed)
    end

    active_from += dict.string_length

    puts dict.sum_of_square_index
  end
end
