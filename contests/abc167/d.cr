# ABC 167 D - Teleporter
# https://atcoder.jp/contests/contests/abc167/tasks/contests/abc167_d

# TLE, WA
# https://atcoder.jp/contests/abc167/submissions/13061095

n, k = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

class Teleporation
  def self.build(a : Array(Int64))
    teleportation = [] of Int64

    current_town = 1
    next_town = a[current_town - 1]

    while !teleportation.includes?(next_town)
      # puts "#{current_town} -> #{next_town}"
      teleportation.push(next_town)

      current_town = next_town
      next_town = a[current_town - 1]
    end

    i = teleportation.index(next_town)
    if i.nil? || i == 0
      appendix = [] of Int64
      circulated = teleportation
    else
      appendix = teleportation[0..(i - 1)]
      circulated = teleportation[1..-1]
    end

    new(appendix, circulated)
  end

  def initialize(@appendix : Array(Int64), @circulated : Array(Int64))
  end

  getter :appendix, :circulated

  def get(i : Int64)
    if i < appendix.size
      appendix[i - 1]
    else
      i -= appendix.size
      n = i % circulated.size
      circulated[n - 1]
    end
  end
end

teleportation = Teleporation.build(a)
# puts teleportation.inspect
puts teleportation.get(k)
