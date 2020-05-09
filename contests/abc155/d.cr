# ABC 155 D - Pairs
# https://atcoder.jp/contests/abc155/tasks/abc155_d

# for Crystal 0.20.5

n, k = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

a_negative = a.select { |i| i < 0 }
a_zero = a.select { |i| i == 0 }
a_positive = a.select { |i| i > 0 }

n_negative_values = a_negative.size
n_zero_values = a_zero.size
n_positive_values = a_positive.size

n_negative_product_values = n_negative_values * n_positive_values
n_zero_product_values = n_zero_values * (n_negative_values + n_positive_values) + (n_zero_values * (n_zero_values - 1) / 2).to_i
n_positive_product_values = (n * (n - 1) / 2 - n_negative_product_values - n_zero_product_values).to_i

position = if k <= n_negative_product_values
             :negative
           elsif k <= (n_negative_product_values + n_zero_product_values)
             :zero
           else
             :positive
           end

if position == :zero
  puts 0
  exit
end

products = [] of Int64

if position == :negative
  0.upto(n_negative_values - 1).each do |i|
    0.upto(n_positive_values - 1).each do |j|
      products.push(a_negative[i] * a_positive[j])
    end
  end

  puts products.sort[k - 1]
  exit
end

# puts "n: #{n}"
# puts "k: #{k}"

k = k - (n_negative_product_values + n_zero_product_values)

if n_negative_values >= 2
  0.upto(n_negative_values - 2).each do |i|
    (i + 1).upto(n_negative_values - 1).each do |j|
      products.push(a_negative[i] * a_negative[j])
    end
  end
end

if n_positive_values >= 2
  0.upto(n_positive_values - 2).each do |i|
    (i + 1).upto(n_positive_values - 1).each do |j|
      products.push(a_positive[i] * a_positive[j])
    end
  end
end

# puts "n_negative_values: #{n_negative_values}"
# puts "n_zero_values: #{n_zero_values}"
# puts "n_positive_values: #{n_positive_values}"
# puts "n_negative_product_values: #{n_negative_product_values}"
# puts "n_zero_product_values: #{n_zero_product_values}"
# puts "n_positive_product_values: #{n_positive_product_values}"
# puts "k: #{k}"

puts products.sort[k - 1]
