# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12820388

q = read_line.to_i64
queries = Array.new(q) { read_line.split }

memos = [] of Type1
string_length = 0_i64
active_from = 0_i64

class Type1
  def initialize(str : String, x : Int64, from : Int64)
    @str = str
    @n_active_chars = x
    @from = from
    @to = from + x - 1
  end

  getter :str, :from, to : Int64
  property n_active_chars : Int64

  def process(dict : Dictionary, active_from_after_query_executed : Int64)
    n_rest_active_chars = to - (active_from_after_query_executed - 1)
    dict.add(str, n_active_chars - n_rest_active_chars)
    self.n_active_chars = n_rest_active_chars
  end

  def within?(n : Int64)
    to < n
  end
end

class Dictionary
  def self.generate(memos : Array(Type1), j : Int32 | Nil)
    dict = new

    last_index = j.nil? ? memos.size.to_i64 : j
    memos.delete_at(0_i64...last_index).each do |memo|
      dict.register(memo)
    end

    dict
  end

  def initialize
    @h = Hash(String, Int64).new
  end

  def register(memo : Type1)
    add(memo.str, memo.n_active_chars)
  end

  def add(str : String, n : Int64)
    @h[str] ||= 0
    @h[str] += n
  end

  def sum_of_square_index : Int64
    @h.values.reduce(0_i64) { |a, b| a + (b.to_i64 ** 2) }.to_i64
  end
end

queries.each do |query|
  t = query[0]

  if t == "1"
    char = query[1]
    x = query[2].to_i64

    memos << Type1.new(char, x, string_length)
    string_length += x
  else
    d = query[1].to_i64

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
