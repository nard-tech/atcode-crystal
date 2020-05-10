# ABC 167 D - Teleporter
# https://atcoder.jp/contests/contests/abc167/tasks/contests/abc167_d

# TLE, WA
# https://atcoder.jp/contests/abc167/submissions/13063999

n, k = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

class Teleporation
  def self.build(a : Array(Int64))
    teleportation = [] of Int64

    current_town = 1
    next_town = a[current_town - 1]
    stop_at = nil

    while !teleportation.includes?(next_town)
      # puts "#{current_town} -> #{next_town}"
      teleportation.push(next_town)

      current_town = next_town
      next_town = a[current_town - 1]
      if current_town == next_town
        stop_at = current_town
        break
      end
    end

    i = teleportation.index(next_town)
    if i.nil? || i == 0
      appendix = [] of Int64
      circulated = teleportation
    else
      appendix = teleportation[0..(i - 1)]
      circulated = teleportation[1..-1]
    end

    new(appendix, circulated, stop_at)
  end

  def initialize(@appendix : Array(Int64), @circulated : Array(Int64), @stop_at : Int64 | Nil)
  end

  getter :appendix, :circulated, :stop_at

  def get(i : Int64)
    if i < appendix.size
      appendix[i - 1]
    else
      i -= appendix.size
      if i < circulated.size
        circulated[i - 1]
      elsif !stop_at.nil?
        stop_at
      else
        n = i % circulated.size
        circulated[n - 1]
      end
    end
  end
end

teleportation = Teleporation.build(a)
# puts teleportation.inspect
puts teleportation.get(k)
