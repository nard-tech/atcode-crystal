# ABC 166 D - I hate Factorization
# https://atcoder.jp/contests/abc166/tasks/abc166_d

# AC
# https://atcoder.jp/contests/abc166/submissions/12808853

x = read_line.to_i64

h = Hash(Int32, Int64).new

(0..120).each do |i|
  h[i] = i.to_i64 ** 5
  h[-i] = -h[i]
end

def search(x, h) : Array(Int32) | Nil
  (-120..120).to_a.each do |a|
    (-120..120).to_a.each do |b|
      return [a, b] if h[a] - h[b] == x
    end
  end

  return nil
end

ab = search(x, h)
raise("Nil is not valid") if ab.nil?
puts ab.as(Array(Int32)).map(&.to_s).join(" ")
