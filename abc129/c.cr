# ABC 129 C - Typical Stairs
# https://atcoder.jp/contests/abc129/tasks/abc129_c

n, m = read_line.split.map(&.to_i64)
a = Array.new(m) { read_line.to_i64 }

patterns = [] of Int64

patterns.push(1_i64) # patterns[0]

if a.includes?(1_i64)
  patterns.push(0_i64)
else
  patterns.push(1_i64) # patterns[1]
end

mod = 1_000_000_007

2_i64.upto(n).each do |i|
  if a.includes?(i.to_i64)
    patterns.push(0_i64)
  else
    patterns.push((patterns[i - 2].to_i64 + patterns[i - 1].to_i64) % mod)
  end
end

puts patterns[n]
