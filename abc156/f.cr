# ABC 156 F - Modularness
# https://atcoder.jp/contests/abc156/tasks/abc156_f

k, q = read_line.split.map(&.to_i64)
d = read_line.split.map(&.to_i64) # 配列 d は長さ k
nxm_s = Array.new(q) { read_line.split.map(&.to_i64) } # nxm のクエリの個数が q

# puts k
# puts q
# puts d.inspect
# puts nxm_s.inspect

nxm_s.each_with_index do |nxm, i|
  n, x, m = nxm
  a = Array(Int64).new(n)

  0.upto(n - 1) do |j|
    if j == 0
      a << x.to_i64
    else
      a << (a[ j - 1 ] + d[(j - 1) % k]).to_i64
    end
  end # 10540 ms

  i = 0

  a[0..(n-2)].each_cons(2) do |con|
    aj, aj1 = con
    if aj % m < aj1 % m
      i += 1
    end
  end

  puts i
end
