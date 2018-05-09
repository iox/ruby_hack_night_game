# Class that calculates the number of passengers on a bus at the end of the
# route
class BusPeople
  def self.calculate(input)
    return 0 if input.empty?
    passengers = 0
    input.each do |first, last|
      passengers += first
      passengers -= last
    end
    error = 'Impossible! More people were dropped than there were in the bus!!'
    raise error if passengers < 0
    passengers
  end
end
