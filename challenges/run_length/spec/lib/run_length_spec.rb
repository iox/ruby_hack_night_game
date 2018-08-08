# Using the Ruby language, have the function RunLength(str) take
# the str parameter being passed and return a compressed version
# of the string using the Run-length encoding algorithm. This
# algorithm works by taking the occurrence of each repeating
# character and outputting that number along with a single
# character of the repeating sequence. For example:
# "wwwggopp" would return 3w2g1o2p. The string will not contain
# any numbers, punctuation, or symbols

require "run_length"

describe RunLength do
  context 'encode' do
    it "simple example" do
      input = 'aabbcde'
      output = '2a2b1c1d1e'
      expect(RunLength.encode(input)).to eq output
    end
    
    it "long example" do
      input = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW'
      output = '12W1B12W3B24W1B14W'
      expect(RunLength.encode(input)).to eq output
    end
  end
  
  context 'decode' do
    it "simple example" do
      input = '2a2b1c1d1e'
      output = 'aabbcde'
      expect(RunLength.decode(input)).to eq output
    end
    
    it "long example" do
      input = '12W1B12W3B24W1B14W'
      output = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW'
      expect(RunLength.decode(input)).to eq output
    end
  end

end