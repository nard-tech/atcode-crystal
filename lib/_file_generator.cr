class FileGenerator
  def initialize(@base_dirname : String, @extension : String, @number_of_files : Int64)
  end

  getter :base_dirname, :extension, :number_of_files

  def generate
    generate_contest_dir
    generate_contest_files
    generate_memo_file
  end

  private def generate_contest_dir
    Dir.mkdir_p(contest_dirname)
  end

  private def contest_dirname : String
    "contests/#{base_dirname.downcase}"
  end

  private def generate_contest_files
    exit unless contest_type && contest_number

    problem_chars.each do |problem_char|
      generate_contest_file(problem_char)
    end
  end

  private def contest_type : String | Nil
    matches = base_dirname.match(/^[A-z]+/)
    return nil unless matches
    matches[0].upcase
  end

  private def contest_number : String | Nil
    matches = base_dirname.match(/\d+$/)
    return nil unless matches
    matches[0]
  end

  private def problem_chars : Array(Char)
    (65..(65 + number_of_files - 1)).map(&.chr).map(&.downcase)
  end

  private def generate_contest_file(problem_char : Char)
    File.open(contest_filename(problem_char), "w") do |f|
      f.puts file_header_row(problem_char)
      f.puts problem_url_row(problem_char)
    end
  end

  private def contest_filename(problem_char : Char) : String
    "#{contest_dirname}/#{problem_char}.#{extension}"
  end

  private def file_header_row(problem_char : Char) : String
    [
      "#",
      contest_type,
      contest_number,
      problem_char.upcase,
    ].join(" ")
  end

  private def problem_url_row(problem_char : Char) : String
    [
      "#",
      problem_url(problem_char),
    ].join(" ")
  end

  private def problem_url(problem_char : Char) : String
    [
      "https://atcoder.jp",
      "contests",
      base_dirname.downcase,
      "tasks",
      "#{base_dirname.downcase}_#{problem_char.downcase}",
    ].join("/")
  end

  private def generate_memo_file
    File.open(memo_filename, "w") do |f|
      f.puts "# #{contest_type} #{contest_number}"
      f.puts ""

      problem_chars.each_with_index do |file_basename, i|
        f.puts "## #{file_basename.upcase}"
        f.puts "" unless i == problem_chars.size - 1
      end
    end
  end

  private def memo_filename
    "#{contest_dirname}/memo.md"
  end
end
