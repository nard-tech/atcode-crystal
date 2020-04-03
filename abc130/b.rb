n, x = gets.split(/ /).map(&:to_i)
l_list = gets.split(/ /).map(&:to_i)

# puts "n: #{n}"
# puts "x: #{x}"
# puts "l_list: #{l_list.inspect} (#{l_list.length})"

class Jump
  def initialize(d, index)
    @d = d
    @index = index
  end

  attr_reader :d, :index
end

d = [Jump.new(0, 1)]
l_list.each.with_index(1) do |l, i|
  d_next = d.last.d + l
  if d_next <= x
    d.push(Jump.new(d_next, i + 1))
  else
    break
  end
end

puts d.last.index
