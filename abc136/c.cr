# ABC 136 C - Build Stairs
# https://atcoder.jp/contests/abc136/tasks/abc136_c

n = read_line.to_i64
h = read_line.split.map(&.to_i64)

class Cell
  def initialize(@height : Int64, @index : Int64)
    @diff = 10_i64 ** 10
  end

  property :height, :index
  property diff : Int64
end

cells = h.map_with_index { |height, i| Cell.new(height, i.to_i64) }

def valid?(cells : Array(Cell)) : Bool
  return true if cells.size == 1

  cells.each_cons(2) do |ab|
    a, b = ab
    diff = b.height - a.height
    a.diff = diff
  end

  # puts cells.inspect

  diffs = cells.map(&.diff)

  return false if diffs.any? { |diff| diff < -1 }
  return true if diffs.all? { |diff| diff >= 0 }

  cells.each_with_index do |cell, i|
    next if cell.diff >= 0

    return false if i > 0 && cells[i - 1].diff == 0
    cells[i].height -= 1
    cell.diff = 0_i64
  end

  return true
end

if valid?(cells)
  puts "Yes"
else
  puts "No"
end
