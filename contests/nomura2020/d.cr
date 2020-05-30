# NOMURA 2020 D - Urban Planning
# https://atcoder.jp/contests/nomura2020/tasks/nomura2020_d

class Town
  def initialize(@request : Int64)
  end

  def determined?
    request > 0
  end
end

n = read_line.to_i64
towns = read_line.split.map(&.to_i64).map { |i| Town.new(i) }

mod = 10_i64 ** 9 + 7

request_patterns = [] of RequestPattern
