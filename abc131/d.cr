# ABC 131 D - Megalomania
# https://atcoder.jp/contests/abc131/tasks/abc131_d

n = read_line.to_i64
ab_list = Array.new(n) { read_line.split.map(&.to_i64) }

class Task
  def initialize(time : Int64, due : Int64)
    @time = time
    @due = due
    @begin_at = 0_i64
  end

  getter :time, :due, :begin_at
  setter begin_at : Int64

  def must_begin_until : Int64
    due - time
  end

  def end_at : Int64
    begin_at + time
  end

  def valid? : Bool
    end_at <= due
  end
end

tasks = ab_list.map { |ab| time, due = ab; Task.new(time, due) }
tasks = tasks.sort_by(&.must_begin_until)

# tasks.each do |task|
#   puts task.inspect
# end

valid = true

tasks[0].begin_at = 0_i64
puts "#{tasks[0].inspect} (end_at: #{tasks[0].end_at})"

tasks[1..-1].each_with_index(1) do |task, i|
  prev_task = tasks[i - 1]

  task.begin_at = prev_task.end_at
  puts "#{task.inspect} (end_at: #{task.end_at})"

  if !task.valid?
    valid = false
    break
  end
end

puts valid ? "Yes" : "No"
