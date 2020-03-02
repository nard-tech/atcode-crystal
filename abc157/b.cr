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

  def selected=(var)
    @selected = var
  end
end

a = Array.new(3) { read_line.split.map(&.to_i64) }.map { |row| row.map { |cell_number| Cell.new(cell_number) }}
n = read_line.to_i64
b_list = Array.new(n) { read_line.to_i64 }

a.each do |row|
  row.each do |cell|
    cell.select(b_list)
  end
end

if a.any? { |row| row.all?(&.selected?) }
  puts "Yes"
elsif a.transpose.any? { |col| col.all?(&.selected?) }
  puts "Yes"
elsif [a[0][0], a[1][1], a[2][2]].all?(&.selected?)
  puts "Yes"
elsif [a[0][2], a[1][1], a[2][0]].all?(&.selected?)
  puts "Yes"
else
  puts "No"
end
