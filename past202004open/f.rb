# 第二回 アルゴリズム実技検定 過去問 F - タスクの消化
# https://atcoder.jp/contests/past202004-open/tasks/past202004_f

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12819608

n = gets.chomp.to_i
ab_s = Array.new(n) { gets.chomp.split.map(&:to_i) }

class Task
  def initialize(begin_at_or_after, point)
    @begin_at_or_after = begin_at_or_after
    @point = point
  end

  attr_reader :begin_at_or_after, :point
end

tasks = ab_s.map { |a, b| Task.new(a, b) }.sort_by(&:point).reverse
schedule = Array.new(n) { nil }

tasks.each do |task|
  if schedule[task.begin_at_or_after - 1].nil?
    schedule[task.begin_at_or_after - 1] = task
  else
    day_index = task.begin_at_or_after - 1
    while !schedule[day_index].nil?
      day_index += 1
    end
    schedule[day_index] = task
  end
end

results = []
schedule.each do |task|
  if results.empty?
    results.push(task.point)
  else
    results.push(results.last + task.point)
  end
end

results.each do |result|
  puts result
end
