# ABC 142 C - Go to School
# https://atcoder.jp/contests/abc142/tasks/abc142_c

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

class Student
  def initialize(@index : Int64, @count : Int64)
  end

  getter :index, :count
end

students = a.map_with_index { |count, i| Student.new((i + 1).to_i64, count) }
puts students.sort_by(&.count).map(&.index).join(" ")
