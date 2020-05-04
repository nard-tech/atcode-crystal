# ABC 166 C - Peaks
# https://atcoder.jp/contests/abc166/tasks/abc166_c

# AC
# https://atcoder.jp/contests/abc166/submissions/12734721

n, m = gets.split(/ /).map(&:to_i)
h = gets.split(/ /).map(&:to_i)
ab_s = Array.new(m) { gets.split(/ /).map(&:to_i) }

ab_h = Hash.new
ab_s.each do |ab|
  a, b = ab
  ab_h[a] ||= []
  ab_h[b] ||= []
  ab_h[a].push(b)
  ab_h[b].push(a)
end

count = 0
h.each.with_index(1) do |observatory, i|
  other_observatories_ids = ab_h[i]
  if other_observatories_ids.nil? || other_observatories_ids.map { |id| h[id - 1] }.all? { |height| height < observatory }
    count += 1
  end
end

puts count
