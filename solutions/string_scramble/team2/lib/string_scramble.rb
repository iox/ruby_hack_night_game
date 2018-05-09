# String Scrable is fun
class StringScramble
  def self.string_scramble(str1, str2)
    str1.chars.sort == str2.chars.sort
  end
end
