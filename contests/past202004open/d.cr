# 第二回 アルゴリズム実技検定 過去問 D - パターンマッチ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_d

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12813711

s = read_line
chars = s.split(//).to_a

matched_t = [] of String

# 1文字
matched_t += chars.uniq
matched_t.push(".")

# 2文字
if chars.size >= 2
  chars.each_cons(2) do |group|
    a, b = group
    matched_t.push("#{a}#{b}")

    matched_t.push("#{a}.")
    matched_t.push(".#{b}")
  end
  matched_t.push("..")
end

# 3文字
if chars.size >= 3
  chars.each_cons(3) do |group|
    a, b, c = group
    matched_t.push("#{a}#{b}#{c}")

    matched_t.push("#{a}#{b}.")
    matched_t.push("#{a}.#{c}")
    matched_t.push(".#{b}#{c}")

    matched_t.push("#{a}..")
    matched_t.push(".#{b}.")
    matched_t.push("..#{c}")
  end
  matched_t.push("...")
end

puts matched_t.sort.uniq.size
