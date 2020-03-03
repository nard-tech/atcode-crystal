# ABC 155 C - Poll
# https://atcoder.jp/contests/abc155/tasks/abc155_c

n = read_line.to_i64
s = Array.new(n) { read_line }
collection = s.tally

max = collection.values.max.to_i64 # Int64 とする
collection.select { |k, v|
  v.to_i64 == max # v を Int64 に cast
}.keys.sort.each do |k|
  puts k
end
