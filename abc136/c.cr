# ABC 136 C - Build Stairs
# https://atcoder.jp/contests/abc136/tasks/abc136_c

n = read_line.to_i64
h = read_line.split.map(&.to_i64)

def valid?(h : Array(Int64)) : Bool
  if h.size == 1
    true
  elsif h.size == 2
    first, last = h
    first <= last + 1
  elsif h.sort == h
    true
  else
    uniq_h = h.uniq
    if uniq_h.size == 1
      true
    elsif uniq_h.size == 2
      a, b = uniq_h
      (a - b).abs == 1
    else
      1.upto(h.size - 2) do |i|
        a, b, c = h[i - 1], h[i], h[i + 1]
        if a > b
          return false if b > c
          return false if a - b > 1
          h[i - 1] = b
        elsif a <= b
          next
        end
      end
      true
    end
  end
end

if valid?(h)
  puts "Yes"
else
  puts "No"
end
