# ABC 131 B - Bite Eating
# https://atcoder.jp/contests/abc131/tasks/abc131_b

n, l = read_line.split.map(&.to_i64)
apples = [] of Apple

class Apple
  def initialize(taste : Int64, index : Int64)
    @taste = taste
    @index = index
  end

  getter :taste, :index

  def diff_if_ate(apple_tastes_sum)
    # (pie_tastes_if_ate(apple_tastes_sum) - apple_tastes_sum).abs
    taste.abs
  end

  def pie_tastes_if_ate(apple_tastes_sum)
    apple_tastes_sum - taste
  end
end

1_i64.upto(n).each do |i|
  apples.push(Apple.new(l + i - 1_i64, i))
end

apple_tastes_sum = apples.map(&.taste).reduce(0) { |acc, i| acc + i }
# pie_tastes = apples.map { |apple| apple.pie_tastes_if_ate(apple_tastes_sum) }
# diff = pie_tastes.map { |pie_taste| (apple_tastes_sum - pie_taste).abs }

eaten_apple = apples.min_by { |apple| apple.diff_if_ate(apple_tastes_sum) }
puts eaten_apple.pie_tastes_if_ate(apple_tastes_sum)
