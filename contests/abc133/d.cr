# ABC 133 D - Rain Flows into Dams
# https://atcoder.jp/contests/abc133/tasks/abc133_d

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

class Dam
  def initialize(amount : Int64, i : Int64)
    @amount = amount
    @i = i
  end

  getter :amount, :i
end

class Mountain
  def initialize(amount : Int64, i : Int64)
    @amount = amount
    @i = i
    @determined = false
  end

  getter :amount, :i
  setter :amount

  setter determined : Bool
end

dams = a.map_with_index { |amount, i| Dam.new(amount, (i + 1).to_i64) }.to_a
dam_min = dams.min_by(&.amount)

dams_reordered = [] of Dam
dams_reordered += dams[(dam_min.i)..n]
dams_reordered += dams[0..(dam_min.i - 1)] if dam_min.i > 0

mountains = 1_i64.upto(n).map { |i| Mountain.new(dam_min.amount, i) }.to_a

# clockwise
dams_reordered[1..((n / 2) + 1)].each do |dam|
  dam_i = dam.i          # e.g. 2
  mountain_i = dam_i + 1 # e.g. 3
  # puts "mountain_i: #{mountain_i}"
  mountain = (mountain_i - 1 >= n ? mountains[mountain_i - 1 - n] : mountains[mountain_i - 1])
  mountain_prev = mountains[mountain_i - 2]
  mountain.amount += dam.amount * 2 - mountain_prev.amount # 2 * (dam.amount - mountain_prev.amount / 2)
  mountain.determined = true
end

# counter-clockwise
dams_reordered[(n / 2) + 1..-1].reverse.each do |dam|
  dam_i = dam.i      # e.g. n, n - 1, ...
  mountain_i = dam_i # e.g. n, n - 1, ...
  mountain = mountains[mountain_i - 1]
  mountain_next = (mountain_i == n ? mountains[0] : mountains[mountain_i])
  mountain.amount += dam.amount * 2 - mountain_next.amount # 2 * (dam.amount - mountain_next.amount / 2)
  mountain.determined = true
end

mountains.each do |mountain|
  puts mountain.amount
end
