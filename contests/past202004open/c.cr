# 第二回 アルゴリズム実技検定 過去問 C - 山崩し
# https://atcoder.jp/contests/past202004-open/tasks/past202004_c

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12813259

n = read_line.to_i
s = Array.new(n) { read_line.split(//) }

(n - 1).downto(1) do |i|
  2.upto(2 * n - 2) do |j|
    cell = s[i - 1][j - 1]
    if cell == "#"
      if [s[i][j - 2], s[i][j - 1], s[i][j]].any? { |str| str == "X" }
        s[i - 1][j - 1] = "X"
      end
    end
  end
end

puts s.map { |row| row.join("") }.join("\n")
