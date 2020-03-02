# ABC 127 C - Prison
# https://atcoder.jp/contests/abc127/tasks/abc127_c

n, m = read_line.split.map(&.to_i64)
gate_infos = Array.new(m) { read_line.split.map(&.to_i64) }

cards = 1.upto(n).to_a
gate_infos.each do |gate_info|
  l, r = gate_info
  cards = cards.select { |card| l <= card && card <= r }
end

puts cards.size
