# ABC 165 C - Many Requirements
# https://atcoder.jp/contests/abc165/tasks/abc165_c

n, m, q = read_line.split.map(&.to_i64)
abcd_s = Array.new(q) { read_line.split.map(&.to_i64) }.sort_by { |abcd| a, b, c, d = abcd; [a, b] }

def generate_arrays(from : Int64, m : Int64, length : Int64) : Array(Array(Int64))
  arrays = [] of Array(Int64)

  if length == 1
    from.upto(m) do |i|
      arrays.push([i])
    end
  else
    from.upto(m) do |i|
      generate_arrays(i, m, length - 1).each do |array|
        arrays.push([i] + array)
      end
    end
  end

  arrays
end

arrays = generate_arrays(1_i64, m, n)

# puts arrays.inspect

puts arrays.max_of { |array|
  sum = 0
  abcd_s.each do |abcd|
    a, b, c, d = abcd
    if array[b - 1] - array[a - 1] == c
      sum += d
    end
  end
  sum
}
