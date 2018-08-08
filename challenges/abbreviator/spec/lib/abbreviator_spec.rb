# # Abbreviator

# The word "i18n" is a common abbreviation of "internationalization" the developer community use instead of typing the whole word and trying to spell it correctly. Similarly, "a11y" is an abbreviation of "accessibility".

# Write a function that takes a string and turns any and all words within that string of length 4 or greater into an abbreviation following the same rules.

# Notes:

# - A "word" is a sequence of alphabetical characters. By this definition, if there is a hyphen (eg. "elephant-ride"), this will produce two, one on either side (eg. "elephant" and "ride").
# - The abbreviated version of the word should have the first letter, then the number of removed characters, then the last letter (e.g. "e6t-r2e").

# Source: http://www.codewars.com/kata/word-a9n-abbreviation/train/ruby



require 'abbreviator'

describe Abbreviator do

  context '.abbreviate(str)' do

    it 'does not abbreviate words shorter than 4 chars' do
      expect(abbreviate('car')).to eq 'car'
      expect(abbreviate('qi')).to eq 'qi'
      expect(abbreviate('a')).to eq 'a'
    end

    it 'returns empty string for empty string arg' do
      expect(abbreviate('')).to eq ''
    end

    it 'returns nil for nil arg' do
      expect(abbreviate(nil)).to be_nil
    end

    it 'replaces letters with count for 4 char word (cake -> c2e)' do
      expect(abbreviate('cake')).to eq 'c2e'
    end

    it 'replaces letters with count for long word (internationalization -> i18n)' do
      expect(abbreviate('internationalization')).to eq 'i18n'
    end

    it 'replaces letters with count for capitalized word (Accessibility -> A11y)' do
      expect(abbreviate('Accessibility')).to eq 'A11y'
    end

    it 'replaces hyphenated words' do
      expect(abbreviate('a-long-hyphenated-word-and-fe-fi-fo-fum')).to eq 'a-l2g-h8d-w2d-and-fe-fi-fo-fum'
    end

    it 'replaces words in sentence' do
      expect(abbreviate('Hello-World, this is a sentence, enjoy!')).to eq ('H3o-W3d, t2s is a s6e, e3y!')
    end
  end

  private

  def abbreviate(str)
    Abbreviator.abbreviate(str)
  end

end