# ABC 126 B - YYMM or MMYY
# https://atcoder.jp/contests/abc126/tasks/abc126_b

s = read_line

first = s[0..1].to_i
last = s[2..3].to_i

def may_be_month?(n)
  1 <= n && n <= 12
end

if may_be_month?(first)
  if may_be_month?(last)
    puts "AMBIGUOUS"
  else
    puts "MMYY"
  end
else
  if may_be_month?(last)
    puts "YYMM"
  else
    puts "NA"
  end
end
