# Hello this is a comment
class BankOcr
  ERROR_MESSAGE = "The account number could not be parsed".freeze
  def initialize(text)
    @text = text
    @numbers = numbers
  end

  def numbers
    { ["   ", "  |", "  |"] => 1, [" _ ", " _|", "|_ "] => 2,
      [" _ ", " _|", " _|"] => 3, ["   ", "|_|", "  |"] => 4,
      [" _ ", "|_ ", " _|"] => 5, [" _ ", "|_ ", "|_|"] => 6,
      [" _ ", "  |", "  |"] => 7, [" _ ", "|_|", "|_|"] => 8,
      [" _ ", "|_|", " _|"] => 9, [" _ ", "| |", "|_|"] => 0 }
  end

  def account_number
    lines = split_in_arrays
    lines.map do |x|
      raise Exception, ERROR_MESSAGE unless @numbers[x]
      @numbers[x].to_s
    end.join
  end

  def split_in_arrays
    lines = @text.split("\n").map do |line|
      line.chars.each_slice(3).to_a
    end
    first_line = lines[0]
    second_line = lines[1]
    third_line = lines[2]
    correct_lines = []
    (0..first_line.length - 1).each do |i|
      correct_lines << [first_line[i].join, second_line[i].join, third_line[i].join]
    end
    correct_lines
  end
end
