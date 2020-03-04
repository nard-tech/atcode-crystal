begin
  dirname, extension = read_line.split
rescue ex : IndexError
  puts ex.message
  exit
end

file_basenames = %w(a b c d e f)

def contest_info(dirname)
  contest_type = dirname.match(/^[A-z]+/)
  return nil unless contest_type
  contest_number = dirname.match(/\d+$/)
  return nil unless contest_number
  { type: contest_type[0].upcase, number: contest_number[0] }
end

Dir.mkdir_p(dirname.downcase)

contest_info = contest_info(dirname)
exit unless contest_info

file_basenames.each do |file_basename|
  File.open("#{dirname.downcase}/#{file_basename}.#{extension}", "w") do |f|
    f.puts "# #{contest_info[:type]} #{contest_info[:number]} #{file_basename.upcase}"
    f.puts "# https://atcoder.jp/contests/#{dirname.downcase}/tasks/#{dirname.downcase}_#{file_basename.downcase}"
  end
end

File.open("#{dirname.downcase}/memo.md", "w") do |f|
  f.puts "#   #{contest_info[:type]} #{contest_info[:number]}"
  f.puts ""

  file_basenames.each do |file_basename|
    f.puts "##  #{file_basename.upcase}"
    f.puts ""
  end
end
