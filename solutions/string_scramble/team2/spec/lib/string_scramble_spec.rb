=begin
 Using the Ruby language, have the function StringScramble(str1,str2) take
 both parameters being passed and return the string true if a portion of
 str1 characters can be rearranged to match str2, otherwise return the
 string false. For example: if str1 is "rkqodlw" and str2 is "world" the
 output should return true. Punctuation and symbols will not be entered
 with the parameters.
=end

require "string_scramble"

describe StringScramble do
  it 'return true if a portion of str1 characters can be rearranged to match str2' do
    str1 = 'cdore'
    str2 = 'coder'
    expect(StringScramble.string_scramble(str1, str2)).to be true
  end
  
  it 'return false if a portion of str1 characters can not be rearranged to match str2' do
    str1 = 'h3llko'
    str2 =  'hello'
    expect(StringScramble.string_scramble(str1, str2)).to be false
  end
  
  it 'return false if a portion of str1 characters can not be rearranged to match str2' do
    str1 = 'Lorem Ipsum is simply dummy text'
    str2 = 'Lmroe spIum is ylmpsi mumyd ttxx'
    expect(StringScramble.string_scramble(str1, str2)).to be false
  end
  
  it 'return true if a portion of str1 characters can not be rearranged to match str2' do
    str1 = 'Lorem Ipsum is simply dummy text'
    str2 = 'Lmroe spIum is ylmpsi mumyd ttxe'
    expect(StringScramble.string_scramble(str1, str2)).to be true
  end
end