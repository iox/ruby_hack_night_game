# Commentz!!
class BankOcr
  def initialize(text)
    @text = text
  end

  def account_number
    validate!
    # p number_array[0]
    puts slice_segment(@text, 0)
    find_number(slice_segment(@text, 0))
  end
  
  private
  
  def find_number(segment)
    number_array.index(segment)
  end
  
  def slice_segment(string, number)
    segments = string.split("\n").map do |line|
      line.chars.each_cons(3).to_a
    end
    
    segments[0][number] + "\n"
    segments[1][number] + "\n"
    segments[2][number]
  end
  
  def number_array
    9.times.map do |i|
      slice_segment(numbers, i)
    end
  end
  
  def numbers
    " _     _  _     _  _  _  _  _ \n" +
    "| |  | _| _||_||_ |_   ||_||_|\n" +
    "|_|  ||_  _|  | _||_|  ||_| _|\n"
  end
  
  def validate!
    unless @text % 3
      "The account number could not be parsed"
    end
  end
end