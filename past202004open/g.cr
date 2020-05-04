# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12815961

q = read_line.to_i64
queries = Array.new(q) { read_line.split }

s = ""

def calc_deleted_chars_index(deleted_chars : String) : Int64
  n = 0_i64
  a = deleted_chars.split(//)
  # puts a.inspect
  h = a.group_by(&.itself)
  # puts h.inspect
  h.each do |k, v|
    next if k == ""
    i = v.size.to_i64
    n += i ** 2
  end
  n
end

queries.each do |query|
  if query.first == "1"
    c = query[1]
    x = query[2].to_i64
    s += c * x
  else
    d = query[1].to_i64
    # puts "s: #{s} (size: #{s.size}), d: #{d}"
    if s.size <= d
      deleted_chars = s.dup
      s = ""
    elsif s == ""
      deleted_chars = ""
      s = ""
    else
      deleted_chars = s[0..(d - 1)].dup
      s = s[d..-1]
    end

    puts calc_deleted_chars_index(deleted_chars)
  end
end
