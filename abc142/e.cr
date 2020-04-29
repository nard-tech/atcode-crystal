# ABC 142 E - Get Everything
# https://atcoder.jp/contests/abc142/tasks/abc142_e

n, m = read_line.split.map(&.to_i64)
keys = Array.new(m) {
  a, b = read_line.split.map(&.to_i64)
  c = read_line.split.map(&.to_i64)
  Key.new(a, c)
}

class Key
  def initialize(@price : Int64, @boxes : Array(Int64))
  end

  getter :price, :boxes

  def can_open?(box : Int64)
    boxes.includes?(box)
  end
end

infinity_price = 10_i64**9

if keys.map(&.boxes).reduce([] of Array(Int64)) { |acc, i| acc | i }.size == n
  # dp = Array.new(n) { Array.new(m + 1) { infinity_price } }
  # 1.upto(n) do |box|
  #   1.upto(m) do |key_index|
  #     if box == 1
  #       key = keys[key_index - 1]
  #       if key_index == 1
  #         dp[box - 1][key_index - 1] = key.price if key.can_open?(box)
  #       else
  #         if dp[box - 1][key_index - 2] == infinity_price
  #           dp[box - 1][key_index - 1] = key.price if key.can_open?(box)
  #         elsif key.can_open?(box)
  #           dp[box - 1][key_index - 1] = [dp[box - 1][key_index - 2], if key.can_open?(box)
  #         end
  #       end
  #       openable_key = keys[0..(key_index - 1)].select { |key| key.can_open?(box) }
  #       dp[box - 1][key_index - 1] = openable_key.as(Key).min_of(&.price) unless openable_key.nil?
  #     elsif key_index == 1
  #       if keys[0].can_open?(box)
  #         dp[box - 1][key_index - 1] = dp[box - 2][key_index - 1]
  #       end
  #     end
  #   end
  # end
  puts "0"
else
  puts "-1"
end
