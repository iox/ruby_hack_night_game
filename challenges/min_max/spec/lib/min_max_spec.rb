# # The Highest Profit Wins!

# ## Story
# Ben has a very simple idea to make some profit: he buys something and sells it again. Of course, this wouldn't give him any profit at all if he was simply to buy and sell it at the same price. Instead, he's going to buy it for the lowest possible price and sell it at the highest.


# ## Task
# Write a function that returns both the minimum and maximum number of the given list/array.


# ## Examples
# ```ruby
# min_max([1,2,3,4,5])   == [1,5]
# min_max([2334454,5])   == [5, 2334454]
# min_max([1])           == [1, 1]
# ```


require 'min_max'

describe 'min_max(nums)' do

  it 'returns min & max as same value for single element nums array' do
    expect(min_max([25])).to match_array [25, 25]
  end

  it 'returns min and max as 1st and 2nd element' do
    nums = [17, 7, 876, 44, 42, 3]
    expect(min_max(nums)).to match_array [3, 876]
  end

  it 'treats negative numbers as less than zero' do
    nums = [0, -1, 0, 2, -23]
    expect(min_max(nums)).to match_array [-23, 2]
  end

end