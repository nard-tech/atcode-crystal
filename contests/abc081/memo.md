#   ABC 081

##  A - Placing Marbles

AC

テーマ: 文字列処理

*   Crystal の `Char` 型

##  B - Shift only

AC

テーマ: while 文，四則演算，数値のメソッド (`Int#even?`)

*   7行目

```ruby
a = read_line.split.map(&:to_i64)
```
ではなく
```ruby
a = read_line.split.map(&.to_i64)
```
であることに注意
