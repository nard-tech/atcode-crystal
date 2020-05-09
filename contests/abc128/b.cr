# ABC 128 B - Guidebook
# https://atcoder.jp/contests/abc128/tasks/abc128_b

n = read_line.to_i64
sp_s = Array.new(n) { read_line.split }

# puts sp_s.inspect

class Restaurant
  def initialize(city : String, point : Int64, i : Int32)
    @city = city
    @point = point
    @index = i
  end

  getter :city, :point, :index
end

restaurants = [] of Restaurant
sp_s.each_with_index(1) do |sp, i|
  city, point = sp
  restaurants.push(Restaurant.new(city, point.to_i64, i))
end

restaurants = restaurants.sort { |a, b|
  if a.city == b.city
    if a.point < b.point
      1
    else
      -1
    end
  else
    a.city <=> b.city
  end
}

restaurants.each do |restaurant|
  puts restaurant.index
end
