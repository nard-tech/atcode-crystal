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

  def kill_monsters(city : City)
    killed_monsters_of_city = [@power, city.monsters].min

    city.monsters -= killed_monsters_of_city
    @power -= killed_monsters_of_city

    # puts "city: #{city.index}, killed_monsters_of_city: #{killed_monsters_of_city}"

    return killed_monsters_of_city
  end
end

cities = a.map_with_index { |element, i| City.new(i, a[i]) }

heros = [] of Hero
i = 0
cities.each_cons(2) do |cities|
  hero = Hero.new(i, b[i], cities.to_a)
  heros.push(hero)
  i += 1
end

# puts cities
# puts heros

killed_monsters = 0_i64

heros.each do |hero|
  first_city, next_city = hero.cities

  killed_monsters += hero.kill_monsters(first_city)
  killed_monsters += hero.kill_monsters(next_city)
end

puts killed_monsters
