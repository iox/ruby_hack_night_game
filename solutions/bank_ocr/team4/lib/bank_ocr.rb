# Bank Ocr baby!
class BankOcr
  def self.decode(text)
    text.lines.map do |line|
      line.scan(/.../)
    end.transpose
  end
  NUMBERS = decode(
    "    _  _     _  _  _  _  _ \n" \
    "  | _| _||_||_ |_   ||_||_|\n" \
    "  ||_  _|  | _||_|  ||_| _|\n"
  )

  def initialize(text)
    @text = text
  end

  def account_number
    self.class.decode(@text).map do |char|
      (NUMBERS.index(char) + 1).to_s
    end.join
  rescue StandardError
    raise "The account number could not be parsed"
  end
end
