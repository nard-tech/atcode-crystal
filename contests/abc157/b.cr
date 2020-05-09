# ABC 157 B - Bingo
# https://atcoder.jp/contests/abc157/tasks/abc157_b

class Cell
  def initialize(number : Int64)
    @number = number
    @selected = false
  end

  getter :number

  def select(numbers)
    if numbers.includes?(number)
      self.selected = true
    end
  end

  def selected?
    @selected
  end

  private def selected=(var)
    @selected = var
  end
end

class Bingo
  def initialize(rows : Array(Array(Cell)))
    @rows = rows
  end

  getter :rows

  def select(numbers)
    rows.each do |row|
      row.each do |cell|
        cell.select(numbers)
      end
    end
  end

  def completed?
    rows.any? { |row| row.all?(&.selected?) } ||
      cols.any? { |col| col.all?(&.selected?) } ||
      [rows[0][0], rows[1][1], rows[2][2]].all?(&.selected?) ||
      [rows[0][2], rows[1][1], rows[2][0]].all?(&.selected?)
  end

  private def cols
    rows.transpose
  end
end

a = Array.new(3) { read_line.split.map(&.to_i64) }.map { |row| row.map { |cell_number| Cell.new(cell_number) }}
n = read_line.to_i64
b_list = Array.new(n) { read_line.to_i64 }

bingo = Bingo.new(a)
bingo.select(b_list)
puts (bingo.completed? ? "Yes" : "No")
