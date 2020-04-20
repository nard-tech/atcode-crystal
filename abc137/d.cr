# ABC 137 D - Summer Vacation
# https://atcoder.jp/contests/abc137/tasks/abc137_d

n, m = read_line.split.map(&.to_i64)
a_and_b = Array.new(n) { read_line.split.map(&.to_i64) }

class Job
  def initialize(@payment_duration : Int64, @price : Int64, limit : Int64)
    @should_begin_on = limit - payment_duration
    @execute_on = nil
  end

  getter :payment_duration, :price
  getter should_begin_on : Int64
  property execute_on : Int64 | Nil

  def executable_on(day_number : Int64)
    should_begin_on >= day_number
  end
end

jobs = a_and_b.map { |ab| a, b = ab; Job.new(a, b, m) }.sort_by(&.price).reverse

jobs_to_do = [] of Job | Nil

0_i64.upto(m - 1) do |i|
  job = jobs.find { |job| job.executable_on(i) }
  if !job.nil?
    job.as(Job).execute_on = i
  end
  jobs.delete(job)
  jobs_to_do.push(job)
end

# jobs_to_do.each do |job|
#   puts job.inspect
# end

price = 0
jobs_to_do.each do |job|
  next if job.nil?
  price += job.as(Job).price
end
puts price
