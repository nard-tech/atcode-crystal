# ABC 088 B - Card Game for Two
# https://atcoder.jp/contests/abc088/tasks/abc088_b

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第6問

n = read_line.to_i64
array = read_line.split.map(&.to_i64)

alice_cards = [] of Int64
bob_cards = [] of Int64

array.sort.reverse.each_slice(2) do |ary|
  if ary.size == 1
    a = ary[0]
    alice_cards.push(a)
  else
    a, b = ary
    alice_cards.push(a)
    bob_cards.push(b)
  end
end

puts alice_cards.sum - bob_cards.sum
