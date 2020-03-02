# ABC 127 D - Integer Cards
# https://atcoder.jp/contests/abc127/tasks/abc127_d

n, m = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)
bn_and_cn = Array.new(m) { read_line.split.map(&.to_i64) }

def selection_sort(a)
  last_index = a.size - 1

  0.upto(last_index) do |i|
    min = a[i]
    min_index = i

    (i + 1).upto(last_index) do |j|
      if a[j] < min
        min = a[j]
        min_index = j
      end
    end

    a[i], a[min_index] = min , a[i]
  end

  a
end

def quick_sort(a)
  return a if a.size <= 1
  base = a.pop
  smaller, bigger = a.partition { |e| e < base }
  a.push(base)
  quick_sort(smaller) + [base] + quick_sort(bigger)
end

def replace(a, b, c)
  a = quick_sort(a)

  0.upto(b - 1) do |i|
    if a[i] < c
      a[i] = c
    end
  end

  a
end

bn_and_cn.each do |b_and_c|
  b, c = b_and_c
  a = replace(a, b, c)
end

sum = a.reduce { |acc, i| acc + i }
puts sum
