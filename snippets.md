# Snippets for competitive programming

## Crystal

```crystal
s = read_line
n = read_line.to_i64

a = read_line.split
a = read_line.split.map(&.to_i64)
a, b = read_line.split.map(&.to_i64)

s = Array.new(n) { read_line }
```

## Ruby

```ruby
s = gets.chomp
n = gets.chomp.to_i

a = gets.chomp.split(/ /)
a = gets.chomp.split(/ /).map(&:to_i)
a, b = gets.chomp.split(/ /).map(&:to_i)

s = Array.new(n) { gets.chomp }
```
