# 第一回 アルゴリズム実技検定 過去問 F - DoubleCamelCase Sort
# https://atcoder.jp/contests/past201912-open/tasks/past201912_f

require "string_scanner"

s = read_line

scanner = StringScanner.new(s)
re = /[A-Z][a-z]*[A-Z]/
a = [] of String

while !scanner.eos?
  result = scanner.scan(re)
  a.push(result) unless result.nil?
end

puts a.sort.join("")
