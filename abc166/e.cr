# ABC 166 E
# https://atcoder.jp/contests/abc166/tasks/abc166_e

# AC
# https://atcoder.jp/contests/abc166/submissions/12810324

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

class Person
  def initialize(@index : Int64, @height : Int64)
    @index_minus_height = index - height
    @index_plus_height = index + height
  end

  getter :index, :height, index_minus_height : Int64, index_plus_height : Int64
end

people = a.map_with_index(1) { |height, i| Person.new(i.to_i64, height) }

h_index_minus_height = Hash(Int64, Array(Person)).new
h_index_plus_height = Hash(Int64, Array(Person)).new

people.each do |person|
  h_index_minus_height[person.index_minus_height] ||= [] of Person
  h_index_plus_height[person.index_plus_height] ||= [] of Person

  h_index_minus_height[person.index_minus_height] = h_index_minus_height[person.index_minus_height].push(person)
  h_index_plus_height[person.index_plus_height] = h_index_plus_height[person.index_plus_height].push(person)
end

count = 0_i64

h_index_minus_height.each do |index_minus_height, people_from_index_minus_height|
  next unless h_index_plus_height.has_key?(index_minus_height)

  people_from_index_plus_height = h_index_plus_height[index_minus_height]
  people_in_both_array = people_from_index_minus_height & people_from_index_plus_height

  count += people_from_index_minus_height.size.to_i64 * people_from_index_plus_height.size.to_i64 - people_in_both_array.size.to_i64
end

puts count
