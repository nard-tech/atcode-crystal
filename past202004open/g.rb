# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12846227

q = gets.to_i
queries = Array.new(q) { gets.chomp.split(/ /) }

memos = []
string_length = 0
string_length_already_removed = 0

class Type1
  def initialize(char, n_active_chars, string_length)
    @char = char
    @n_active_chars = n_active_chars
    @string_length = string_length
  end

  attr_reader :char, :string_length
  attr_accessor :n_active_chars

  def process(dict, d_actualy_removed)
    tmp = string_length - d_actualy_removed
    dict.update(char, n_active_chars - tmp)
    self.n_active_chars = tmp
  end
end

def find_index(memos, last_position_of_actualy_removed)
  (0..(memos.size - 1)).bsearch { |k|
    memo = memos[k]
    memo.string_length > last_position_of_actualy_removed
  }
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
    update(char, memo.n_active_chars)
  end

  def update(char, n)
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
    n_active_chars = b.to_i

    string_length += n_active_chars
    memos << Type1.new(char, n_active_chars, string_length)
  else
    d = a.to_i

    last_position_of_actualy_removed = [d + string_length_already_removed, string_length].min

    j = find_index(memos, last_position_of_actualy_removed)
    dict = Dictionary.generate(memos, j)

    if j
      memo = memos[0]
      memo.process(dict, last_position_of_actualy_removed)
    end

    string_length_already_removed += dict.string_length

    puts dict.sum_of_square_index
  end
end
