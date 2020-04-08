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

  def down
    @height -= 1 # 現在の cell を 1 小さくする
    @diff += 1   # 現在の cell 次のセルとの差分を 1 大きくする
  end
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
    if i == 0   # 最初の cell
      cell.down #   現在の cell を 1 小さくし，次のセルとの差分を 1 大きくする
      next
    end

    # index が 1 以上

    prev_cell = cells[i - 1]

    if prev_cell.diff == 0            # 前の cell の diff が 0
      return false if cell.diff == -1 #   現在の cell の diff が -1 なら終わり
      next                            #   現在の cell の diff が 0 以上なら次の cell へ
    else                              # 前の cell の diff が 0 より大きい
      cell.down                       #   現在の cell を 1 小さくし，次のセルとの差分を 1 大きくする
      prev_cell.diff -= 1             #   前の cell と現在の cell との差分を 1 小さくする
    end
  end

  return true
end

puts (valid?(cells) ? "Yes" : "No")
