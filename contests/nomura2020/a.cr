# NOMURA 2020 A - Study Scheduling
# https://atcoder.jp/contests/nomura2020/tasks/nomura2020_a

h1, m1, h2, m2, k = read_line.split.map(&.to_i64)

puts (h2 * 60 + m2) - (h1 * 60 + m1) - k
