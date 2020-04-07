# ABC 133 C - Remainder Minimization 2019
# https://atcoder.jp/contests/abc133/tasks/abc133_c

l, r = read_line.split.map(&.to_i64)
mod = 2019

# puts r - l

if r - l <= mod
  mods = l.upto(r).map { |i| i % mod }.to_a
  # puts mods.first

  if mods.includes?(0_i64)
    puts 0
  else
    result = 2018

    0.upto(mods.size - 2) do |i|
      (i + 1).upto(mods.size - 1) do |j|
        calc = (mods[i] * mods[j]) % mod
        # puts calc
        result = calc if calc < result
      end
    end

    puts result
  end
else
  puts 0
end
