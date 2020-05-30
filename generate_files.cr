require "./lib/_file_generator"

begin
  base_dirname, extension, number_of_files = read_line.split
rescue ex : IndexError
  puts ex.message
  exit
end

FileGenerator.new(base_dirname, extension, number_of_files.to_i64).generate
