# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12848331

q = gets.to_i
queries = Array.new(q) { gets.chomp.split(/ /) }

memos = []
string_length = 0
active_from = 0

class Type1
  def initialize(char, x, from)
    @char = char
    @n_active_chars = x
    @from = from
    @to = from + x - 1
  end

  attr_reader :char, :from, :to
  attr_accessor :n_active_chars

  def process(dict, active_from_after_query_executed)
    n_rest_active_chars = to - (active_from_after_query_executed - 1)
    dict.add(char, n_active_chars - n_rest_active_chars)
    self.n_active_chars = n_rest_active_chars
  end

  def within?(n)
    to < n
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
    add(memo.char, memo.n_active_chars)
  end

  def add(char, n)
    @h[char] ||= 0
    @h[char] += n
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

    memos << Type1.new(char, x, string_length)
    string_length += x
  else
    d = a.to_i

    # クエリ実行の結果空文字列ができる場合は
    # active_from_after_query_executed == string_length
    active_from_after_query_executed = [d + active_from, string_length].min

    j = memos.bsearch_index { |memo|
      !memo.within?(active_from_after_query_executed)
    }
    dict = Dictionary.generate(memos, j)

    if j
      memo = memos[0]
      memo.process(dict, active_from_after_query_executed)
    end

    active_from = active_from_after_query_executed

    puts dict.sum_of_square_index
  end
end
