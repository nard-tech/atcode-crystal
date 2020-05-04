# ABC 166 E - This Message Will Self-Destruct in 5s
# https://atcoder.jp/contests/abc166/tasks/abc166_e

# AC
# https://atcoder.jp/contests/abc166/submissions/12809513

n = gets.chomp.to_i
a = gets.chomp.split(/ /).map(&:to_i)

class Person
  def initialize(index, height)
    @index = index
    @height = height
  end

  attr_reader :index, :height

  def index_minus_height
    @index_minus_height ||= index - height
  end

  def index_plus_height
    @index_plus_height ||= index + height
  end
end

people = a.map.with_index(1) { |height, i| Person.new(i, height) }

h_index_minus_height = Hash.new
h_index_plus_height = Hash.new

people.each do |person|
  h_index_minus_height[person.index_minus_height] ||= []
  h_index_plus_height[person.index_plus_height] ||= []

  h_index_minus_height[person.index_minus_height].push(person)
  h_index_plus_height[person.index_plus_height].push(person)
end

count = 0

h_index_minus_height.each do |index_minus_height, people_from_index_minus_height|
  people_from_index_plus_height = h_index_plus_height[index_minus_height]
  next if people_from_index_plus_height.nil?
  people_in_both_array = people_from_index_minus_height & people_from_index_plus_height
  count += people_from_index_minus_height.size * people_from_index_plus_height.size - people_in_both_array.size
end

puts count
