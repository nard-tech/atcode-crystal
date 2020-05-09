# ABC 136 B - Uneven Numbers
# https://atcoder.jp/contests/abc136/tasks/abc136_b

n = read_line.to_i64

digits = n.to_s.size
odd_digit_numbers = 0

# puts "digits: #{digits}"

digits.downto(1) do |i|
  next if i % 2 == 0

  if i == digits
    if i == 1
      odd_digit_numbers += n
    else
      odd_digit_numbers += (n - ("9" * (digits - 1)).to_i64)
    end
  else
    odd_digit_numbers += 9 * 10 ** (i - 1)
  end
end

puts odd_digit_numbers
