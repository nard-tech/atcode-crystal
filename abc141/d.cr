# ABC 141 D - Powerful Discount Tickets
# https://atcoder.jp/contests/abc141/tasks/abc141_d

n, m = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

class Item
  def initialize(@price : Int64)
  end

  getter :price

  def discount(tickets : Int64) : Int64
    [(price * 1.0 * (2_i64**(-tickets.to_f64))).floor, 0].max.to_i64
  end
end

items = a.map { |price| Item.new(price) }.sort_by(&.price).reverse # 高い順
dp = Array.new(n) { Array.new(m + 1) { 0_i64 } }

0_i64.upto(n - 1) do |i|
  item = items[i]

  0_i64.upto(m) do |j|
    if i == 0
      # puts "j: #{j}, item.discount(#{j}) = #{item.discount(j)}" if j < 40
      dp[i][j] = item.discount(j)
    elsif j == 0
      dp[i][j] = dp[i - 1][j] + item.price
    else
      candidates = 0_i64.upto(j).map { |k| dp[i - 1][j - k] + item.discount(k) }
      # puts candidates.inspect
      dp[i][j] = candidates.min
    end
  end
end

puts dp[n - 1][m]
