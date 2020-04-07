# ABC 135 C - City Savers
# https://atcoder.jp/contests/abc135/tasks/abc135_c

n = read_line.to_i64
a = read_line.split.map(&.to_i64)
b = read_line.split.map(&.to_i64)

class City
  def initialize(@index : Int32, @monsters : Int64)
  end

  property :index, :monsters
end

class Hero
  property :index, :power, :cities

  def initialize(@index : Int32, @power : Int64, @cities : Array(City))
  end
end

cities = a.map_with_index { |element, i| City.new(i + 1, a[i]) }

heros = [] of Hero
i = 0
cities.each_cons(2) do |cities|
  hero = Hero.new(i + 1, b[i], cities.to_a)
  heros.push(hero)
  i += 1
end

# puts cities
# puts heros

killed_monsters = 0

heros.each do |hero|
  first_city, next_city = hero.cities

  killed_monsters_of_first_city = [hero.power, first_city.monsters].min

  killed_monsters += killed_monsters_of_first_city
  hero.power -= killed_monsters_of_first_city
  first_city.monsters -= killed_monsters_of_first_city

  killed_monsters_of_next_city = [hero.power, next_city.monsters].min

  killed_monsters += killed_monsters_of_next_city
  hero.power -= killed_monsters_of_next_city
  next_city.monsters -= killed_monsters_of_next_city
end

puts killed_monsters
