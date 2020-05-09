# ABC 139 C - Lower
# https://atcoder.jp/contests/abc139/tasks/abc139_c

n = read_line.to_i64
h = read_line.split.map(&.to_i64)

class Cell
  def initialize(@height : Int64)
    @count = 0.to_i64
  end

  getter :height
  property count : Int64
end

cells = h.map { |height| Cell.new(height) }

1.upto(n - 1) do |i|
  current_cell = cells[i]
  prev_cell = cells[i - 1]

  if prev_cell.height >= current_cell.height
    current_cell.count = prev_cell.count + 1
  end
end

puts cells.max_of(&.count)
