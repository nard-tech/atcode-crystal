# 第二回 アルゴリズム実技検定 過去問 A - エレベーター
# https://atcoder.jp/contests/past202004-open/tasks/past202004_a

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12812341

st = read_line.split

class Stair
  def initialize(@str : String)
  end

  getter :str

  def undergroud?
    str =~ /\B\d/
  end

  def index
    if undergroud?
      str.gsub("B", "").to_i64
    else
      str.gsub("F", "").to_i64
    end
  end
end

s, t = st.map { |str| Stair.new(str) }
if [s, t].all?(&.undergroud?) || [s, t].none?(&.undergroud?)
  puts (s.index - t.index).abs
else
  puts s.index + t.index - 1
end
