# ABC 151 C - Welcome to AtCoder
# https://atcoder.jp/contests/abc151/tasks/abc151_c

n, m = read_line.split.map(&.to_i64)
ps = Array.new(m) { p, s = read_line.split; [p.to_i64, s] }

acs = 0_i64
was = 0_i64

groups = ps.group_by(&.first)

groups.each do |problem, pss|
  pss.each do |ps|
    answer = ps[1]
    if answer == "WA"
      was += 1_i64
    elsif answer == "AC"
      acs += 1_i64
      break
    end
  end
end

puts "#{acs} #{was}"
