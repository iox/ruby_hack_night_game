# Compare two strings
class StringScramble
  def self.string_scramble(str1, str2)
    arr1 = str1.chars.sort
    arr2 = str2.chars.sort
    arr1 == arr2
  end
end
