# ABC 126 C - Dice and Coin
# https://atcoder.jp/contests/abc126/tasks/abc126_c

n, k = read_line.split.map(&.to_i64)

LN_2 = Math.log(2)

def log_2(n)
  Math.log(n) / LN_2
end

log_2_k = log_2(k)

# --------

def p(i, log_2_k)
  2 ** (- (log_2_k - log_2(i)).ceil)
end

p = if n <= k
      (1.upto(n).to_a.map { |i| p(i, log_2_k) }.sum) * 1.0 / n
    else
      (n - k + (1).upto(k).to_a.map { |i| p(i, log_2_k) }.sum) * 1.0 / n
    end

puts p
