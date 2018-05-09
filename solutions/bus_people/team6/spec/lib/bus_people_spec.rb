=begin
There is a bus moving in the city, and it takes and drop some people in each bus stop.

You are provided with a list (or array) of integer arrays (or tuples). Each integer array has two items which represent number of people get into bus (The first item) and number of people get off the bus (The second item) in a bus stop.

Your task is to return number of people who are still in the bus after the last bus station (after the last array). Even though it is the last bus stop, the bus is not empty and some people are still in the bus, and they are probably sleeping there :D

Take a look on the test cases.

Please keep in mind that the test cases ensure that the number of people in the bus is always >= 0. So the return integer can't be negative.

The second value in the first integer array is 0, since the bus is empty in the first bus stop.
=end

require "bus_people"

describe BusPeople do
  it "empty example" do
    input = []
    expect(BusPeople.calculate(input)).to eq 0
  end
  
  it "simple example" do
    input = [[10, 0], [3, 5], [5, 8]]
    expect(BusPeople.calculate(input)).to eq 5
  end
  
  it "longer example" do
    input = [[3, 0], [9, 1], [4, 10], [12, 2], [6, 1], [7, 10]]
    expect(BusPeople.calculate(input)).to eq 17
  end
  
  it "impossible example" do
    input = [[3, 0], [0, 5]]
    expect do
      BusPeople.calculate(input)
    end.to raise_error "Impossible! More people were dropped than there were in the bus!!"
  end
end