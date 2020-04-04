# ABC 161 D - Lunlun Number
# https://atcoder.jp/contests/abc161/tasks/abc161_d

k = read_line.to_i64

def generate_new_runrun_numbers(n : Int64) : Array(Int64)
  digits = n.to_s.split(//).map(&.to_i)
  first_digit = digits.first

  new_runrun_numbers = [] of Int64

  if first_digit == 1
    new_runrun_numbers.push("1#{n}".to_i64)
    new_runrun_numbers.push("2#{n}".to_i64)
  elsif first_digit == 9
    new_runrun_numbers.push("8#{n}".to_i64)
    new_runrun_numbers.push("9#{n}".to_i64)
  else
    new_runrun_numbers.push("#{first_digit - 1}#{n}".to_i64)
    new_runrun_numbers.push("#{first_digit}#{n}".to_i64)
    new_runrun_numbers.push("#{first_digit + 1}#{n}".to_i64)
  end

  new_runrun_numbers
end

runrun_numbers = 1_i64.upto(9_i64).to_a

n_digits = 2
while runrun_numbers.size <= k
  new_runrun_numbers = [] of Int64

  runrun_numbers.push(("1" + "0" * (n_digits - 1)).to_i64)

  runrun_numbers.each do |runrun_number|
    new_runrun_numbers += generate_new_runrun_numbers(runrun_number)
  end

  runrun_numbers += new_runrun_numbers.sort.uniq
  n_digits += 1
end

# puts runrun_numbers.inspect

puts runrun_numbers[k - 1]
