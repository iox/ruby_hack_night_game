# bus entries and exits
class BusPeople
  def self.calculate(input)
    on_bus = 0
    input.map do |arr|
      on_bus += arr[0]
      if on_bus >= arr[1]
        on_bus -= arr[1]
      else
        raise ArgumentError.new("Impossible! More people were dropped than there were in the bus!!")
      end
    end
    on_bus
  end
end

# input = [[10, 0], [3, 5], [5, 8]]
