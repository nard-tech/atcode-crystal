# ABC 157 E - Simple String Queries
# https://atcoder.jp/contests/abc157/tasks/abc157_e

n = read_line.to_i64
s = read_line
q = read_line.to_i64
queries = Array.new(q) { read_line.split }

queries.each do |query|
  query_type = query[0].to_i64
  if query_type == 1
    _type, i, c = query
    i_as_number = i.to_i64
    s = s[0..(i_as_number - 2)] + c + s[i_as_number..-1]
    # s[i_as_number - 1] = c
    # puts "(1) #{s}"
  elsif query_type == 2
    _type, l, r = query
    l_as_number = l.to_i64
    r_as_number = r.to_i64
    substring = s[(l_as_number - 1)..(r_as_number - 1)]
    # puts "(2) #{substring} -> #{substring.split(//).uniq}"
    puts substring.split(//).uniq.size
  end
end
