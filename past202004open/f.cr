# 第二回 アルゴリズム実技検定 過去問 F - タスクの消化
# https://atcoder.jp/contests/past202004-open/tasks/past202004_f

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12815301

n = read_line.to_i64
ab_s = Array.new(n) { read_line.split.map(&.to_i64) }

class Task
  def initialize(@begin_at_or_after : Int64, @point : Int64)
  end

  getter :begin_at_or_after, :point
end

tasks = ab_s.map { |ab| a, b = ab; Task.new(a, b) }.sort_by(&.begin_at_or_after)

def serach_task(tasks : Array(Task), day : Int64, n : Int64) : Task
  over_index = tasks.bsearch_index { |task| task.begin_at_or_after > day }
  over_index = n if over_index.nil?
  task = tasks[0..(over_index - 1)].max_by(&.point)
  tasks.delete(task)
  task
end

results = [] of Int64
tasks_to_execute = Hash(Int64, Array(Task)).new { [] of Task }

1.upto(n) do |k|
  task = serach_task(tasks, k.to_i64, n)
  if k == 1
    tasks_to_execute[1_i64] = [task]
  else
    tasks_to_execute[k.to_i64] = tasks_to_execute[k - 1] + [task]
  end
end

tasks_to_execute.values.each do |v|
  puts v.sum(&.point)
end
