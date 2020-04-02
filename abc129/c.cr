# ABC 129 C - Typical Stairs
# https://atcoder.jp/contests/abc129/tasks/abc129_c

n, m = read_line.split.map(&.to_i64)
a = Array.new(m) { read_line.to_i64 }
valid_stairs = Array.new(n + 1) { true }
a.each do |ignored_stair|
  valid_stairs[ignored_stair] = false
end

mod = 1_000_000_007

patterns = Array.new(n + 1) { 0_i64 }

patterns[0] = 1_i64

0_i64.upto(n).each do |i|
  if i + 1 <= n && valid_stairs[i + 1]
    patterns[i + 1] += patterns[i] % mod
  end

  if i + 2 <= n && valid_stairs[i + 2]
    patterns[i + 2] += patterns[i] % mod
  end
end

puts patterns[n] % mod
