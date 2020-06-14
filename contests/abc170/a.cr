# ABC 170 A - Five Variables
# https://atcoder.jp/contests/abc170/tasks/abc170_a

# AC
# https://atcoder.jp/contests/abc170/submissions/14288240

x = read_line.split.map(&.to_i64)
x.each_with_index(1) do |v, i|
  if v == 0
    puts i
    break
  end
end
