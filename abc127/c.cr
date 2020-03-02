# ABC 127 C - Prison
# https://atcoder.jp/contests/abc127/tasks/abc127_c

n, m = read_line.split.map(&.to_i64)
gate_infos = Array.new(m) { read_line.split.map(&.to_i64) }

puts gate_infos.reduce(1.upto(n).to_a) { |acc, gate_info|
  l, r = gate_info
  acc & l.upto(r).to_a
}.size
