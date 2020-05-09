# ABC 127 A - Ferris Wheel
# https://atcoder.jp/contests/abc127/tasks/abc127_a

age, price_base = read_line.split.map(&.to_i64)
price = if age >= 13
          price_base
        elsif age >= 6
          (price_base / 2).to_i64
        else
          0
        end

puts price
