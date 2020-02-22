#   ABC 081

##  B - Shift only

*   7行目

```ruby
a = read_line.split.map(&:to_i64)
```
ではなく
```ruby
a = read_line.split.map(&.to_i64)
```
であることに注意
