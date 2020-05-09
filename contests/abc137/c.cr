# ABC 137 C - Green Bin
# https://atcoder.jp/contests/abc137/tasks/abc137_c

n = read_line.to_i64
strings = Array.new(n) { read_line }
h = strings.group_by { |str| str.split(//).sort.join("") }

i = 0_i64
h.each do |k, v|
  v_size = v.size.to_i64
  next if v_size == 1_i64
  i += v_size * (v_size - 1_i64) / 2
end

puts i
