# ABC 159 D
# https://atcoder.jp/contests/abc159/tasks/abc159_d

n = gets.to_i
a = gets.split(/ /).map(&:to_i)

a_uniq_size = a.uniq.size

class Pattern
  def initialize(i)
    @i = i
    @array = []
  end

  def push(k)
    @array.push(k)
  end

  def size
    @size ||= @array.size
  end

  def calc
    @calc ||= size * (size - 1) / 2
  end
end

if a_uniq_size == a.size
  n.times do
    puts 0
  end
elsif a_uniq_size == 1
  patterns = (n - 1) * (n - 2) / 2
  n.times do
    puts patterns
  end
else
  h = {}

  a.each_with_index do |ai, i|
    h[ai] ||= Pattern.new(ai)
    h[ai].push(i)
  end

  base = h.values.map(&:calc).sum

  h2 = {}

  a.each_with_index do |ai, i|
    pattern = h[ai]
    if h2[ai].nil?
      result = base - (pattern.size - 1)
      h2[ai] = result
      puts result
    else
      puts h2[ai]
    end
  end
end
