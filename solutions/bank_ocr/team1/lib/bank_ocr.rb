NUM_TO_NUM = [
  "",
  "       ||",
  "  |___ | ",
  "   ___ ||",
  " |  _  ||",
  " | ___  |",
  " ||___  |",
  "   _   ||",
  " ||___ ||",
  " | ___ ||"
].freeze

# Very important!
class BankOcr
  def initialize(text)
    @text = text
  end

  def account_number
    @text.split("\n")
         .map(&:chars)
         .transpose
         .map(&:join)
         .each_slice(3)
         .map(&:join)
         .map { |a| NUM_TO_NUM.index(a) }.join
  rescue StandardError
    raise "The account number could not be parsed"
  end
end
