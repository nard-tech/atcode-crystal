# ABC 166 C - Peaks
# https://atcoder.jp/contests/abc166/tasks/abc166_c

# AC
# https://atcoder.jp/contests/abc166/submissions/12808642

n, m = read_line.split.map(&.to_i64)
h = read_line.split.map(&.to_i64)
ab_s = Array.new(m) { read_line.split.map(&.to_i64) }

class Observatory
  def initialize(@index : Int64, @height : Int64)
    @connected_observatories = [] of Observatory
  end

  getter :height, :connected_observatories, :connected_observatories

  def connect_to(observatory : Observatory)
    connected_observatories.push(observatory)
  end

  def good?
    connected_observatories.empty? || connected_observatories.all? { |observatory| height > observatory.height }
  end
end

observatories = h.map_with_index(1) { |height, i| Observatory.new(i.to_i64, height) }

ab_s.each do |ab|
  a, b = ab

  observatory_a = observatories[a - 1]
  observatory_b = observatories[b - 1]

  observatory_a.connect_to(observatory_b)
  observatory_b.connect_to(observatory_a)
end

puts observatories.select(&.good?).size
