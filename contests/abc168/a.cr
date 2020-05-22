# ABC 168 A - ∴ (Therefore)
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_a

# AC
# https://atcoder.jp/contests/abc168/submissions/13289577

n = read_line.to_i64

case n % 10
when 2, 4, 5, 7, 9
  puts "hon"
when 0, 1, 6, 8
  puts "pon"
when 3
  puts "bon"
end
