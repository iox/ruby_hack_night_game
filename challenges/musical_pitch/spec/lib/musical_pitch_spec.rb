# # Musical Pitch Classes

# In music, each note is named by its pitch class (e.g., C, E♭, F♯), and each pitch class can alternatively be expressed as an integer from 0 to 11. Your task will be to write a method called `pitch_class` that, when given a letter-based pitch class, returns the corresponding integer.

# Only seven letters are used to name the notes: "A" through "G". These letter names are cyclical, just like the days of the week. The notes corresponding to those letters are called the "natural notes". Here are the numbers corresponding to each of them:

# - C : 0
# - D : 2
# - E : 4
# - F : 5
# - G : 7
# - A : 9
# - B : 11

# So `pitch_class('D')` should return 2, and `pitch_class('B')` should return 11.

# The sharp sign ("♯") is essentially an increment operator, so "C♯" (pronounced "C sharp") refers to one note higher than C, which has a value of 1, whereas F♯ has a value of 6. Since Codewars doesn't allow the sharp sign, we'll use a number sign ("#") instead.

# The flat sign ("♭") is the opposite of a sharp, meaning one note lower. F♭ has a value of 4, and C♭ has a value of 11 (the twelve-note system is cyclical). Since Codewars doesn't allow the flat sign, we'll use a lowercase "b" instead.

# Return `nil` for invalid input.

# Source: http://www.codewars.com/kata/musical-pitch-classes/train/ruby

require 'musical_pitch'

describe 'pitch_class(pitch_class)' do

  it 'converts natural notes' do
    expect_conversion 'C', 0
    expect_conversion 'D', 2
    expect_conversion 'E', 4
    expect_conversion 'F', 5
    expect_conversion 'G', 7
    expect_conversion 'A', 9
    expect_conversion 'B', 11
  end

  it 'converts sharps' do
    expect_conversion 'C#', 1
    expect_conversion 'D#', 3
    expect_conversion 'E#', 5
    expect_conversion 'F#', 6
    expect_conversion 'G#', 8
    expect_conversion 'A#', 10
    expect_conversion 'B#', 0
  end

  it 'converts flats' do
    expect_conversion 'Db', 1
    expect_conversion 'Eb', 3
    expect_conversion 'Fb', 4
    expect_conversion 'Gb', 6
    expect_conversion 'Ab', 8
    expect_conversion 'Bb', 10
    expect_conversion 'Cb', 11
  end

  it 'returns nil for unknown note' do
    expect_conversion 'X', nil
  end

  it 'returns nil for too long input' do
    expect_conversion 'Fb#', nil
    expect_conversion 'HelloWorld', nil
  end

  it 'returns nil for natural note with unknown suffix' do
    expect_conversion 'Cd', nil
    expect_conversion 'G#asdf', nil
    expect_conversion 'Gx#', nil
  end

  private

  def expect_conversion(from, expected)
    actual = pitch_class(from)
    expect(actual).to(eq(expected), "Should have converted '#{from}' to #{expected}, got: #{actual.inspect}")
  end

end