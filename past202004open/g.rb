# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12827781

q = gets.to_i
queries = Array.new(q) { gets.chomp.split(/ /) }

queue = []
s = 0
removed = 0

queries.each do |query|
  t, a, b = query

  if t == "1"
    c = a
    x = b.to_i

    s += x
    queue << { c: c, x: x, l: s }
  else
    d = a.to_i
    d2 = [d + removed, s].min

    j = (0...queue.size).bsearch { |k|
      memo = queue[k]
      d2 < memo[:l]
    }

    cs = {}

    queue.slice!(0...(j || queue.size)).each { |memo|
      c = memo[:c]
      cs[c] = (cs[c] || 0) + memo[:x]
    }

    if j
      memo = queue[0]
      c = memo[:c]
      x = memo[:x]
      memo[:x] = memo[:l] - d2
      cs[c] = (cs[c] || 0) + x - memo[:x]
    end

    removed += cs.values.reduce(0, :+)

    puts cs.values.reduce(0) { |a, b| a + (b ** 2) }
  end
end
