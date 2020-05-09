# ABC 162 F - Select Half
# https://atcoder.jp/contests/abc162/tasks/abc162_f

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

def calc_sum_if_even(a : Array(Int64))
  sum_of_even_index = 0_i64
  sum_of_odd_index = 0_i64

  a.each_with_index do |n, i|
    if i.even?
      sum_of_even_index += n
    else
      sum_of_odd_index += n
    end
  end

  [sum_of_even_index, sum_of_odd_index].max
end

if n.even?
  puts calc_sum_if_even(a)
else
  n_integers = n // 2
end
