# ABC 166 C - Peaks
# https://atcoder.jp/contests/abc166/tasks/abc166_c

# AC
# https://atcoder.jp/contests/abc166/submissions/12808506

n, m = read_line.split.map(&.to_i64)
h = read_line.split.map(&.to_i64)
ab_s = Array.new(m) { read_line.split.map(&.to_i64) }

ab_h = Hash(Int64, Array(Int64)).new { [] of Int64 }
ab_s.each do |ab|
  a, b = ab
  ab_h[a] = ab_h[a].push(b) # ab_h[a].push(b) は不可
  ab_h[b] = ab_h[b].push(a)
end

count = 0
h.each_with_index(1) do |observatory, i|
  if ab_h.has_key?(i)
    other_observatories_ids = ab_h[i]
    if other_observatories_ids.map { |id| h[id - 1] }.all? { |height| height < observatory }
      count += 1
    end
  else
    count += 1
  end
end

puts count
