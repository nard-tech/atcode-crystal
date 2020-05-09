# HITACHI 2020 D - Manga Market
# https://atcoder.jp/contests/hitachi2020/tasks/hitachi2020_d

n, last = read_line.split.map(&.to_i64)
array_of_ab = Array.new(n) { read_line.split.map(&.to_i64) }

closed_at = last

class Shop
  def initialize(shop_number : Int32, a : Int64, b : Int64)
    @shop_number = shop_number
    @a = a
    @b = b
  end

  getter :shop_number, :a, :b

  def arrival_time(start_at : Int64)
    start_at + 1
  end

  def waiting_time(_arrival_time : Int64)
    a * _arrival_time + b
  end

  def can_buy?(_arrival_time : Int64, _waiting_time : Int64, closed_at : Int64)
    _arrival_time + _waiting_time <= closed_at
  end
end

shops = [] of Shop
array_of_ab.each_with_index do |ab, i|
  a, b = ab
  shops.push(Shop.new(i, a, b))
end

shops = shops.sort_by { |shop| [shop.a, shop.a + shop.b] }

i = 0_i64
t = 0_i64

b = true
while b
  # 移動 - 到着
  arrival_time = t + 1
  t += 1

  if shops.empty?
    b = false
    break
  end

  next_shop = shops.shift

  # 到着 - 待機
  waiting_time = next_shop.waiting_time(arrival_time)
  t += waiting_time

  if next_shop.can_buy?(arrival_time, waiting_time, closed_at)
    i += 1

    # puts "shop: #{next_shop.shop_number}, a: #{next_shop.a}, b: #{next_shop.b}"
    # puts "arrival_time: #{arrival_time}, waiting_time: #{waiting_time}, buy_at: #{t}"
    # puts ""
  else
    b = false
  end
end

puts i
