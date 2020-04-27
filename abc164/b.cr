# ABC 164 B - Battle
# https://atcoder.jp/contests/abc164/tasks/abc164_b

a, b, c, d = read_line.split.map(&.to_i64)
takahashi_monster_power = a
aoki_monster_power = c

takahashi_attacked_count = (a / d).ceil
aoki_attacked_count = (c / b).ceil

if takahashi_attacked_count == aoki_attacked_count
  puts "Yes"
elsif takahashi_attacked_count > aoki_attacked_count
  puts "Yes"
else
  puts "No"
end
