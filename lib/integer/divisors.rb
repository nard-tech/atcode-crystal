# 自然数の約数を配列として返すメソッド
# @param n [Integer] 自然数
# @return [Array<Integer>] 約数（自然数）の配列（昇順でソート済み）
def divisors(n)
  list_a = []
  list_b = []

  (1..(Math.sqrt(n))).each do |i|
    div, mod = n.divmod(i)
    if mod.zero?
      list_a.push(i)
      list_b.push(div)
    end
  end

  list_b.pop if list_b.last == list_a.last
  list_a + list_b.reverse
end
