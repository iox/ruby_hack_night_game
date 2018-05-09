class BusPeople
  def self.calculate(input)
    return 0 if input.empty?
    bus_people = 0
    input.each do |array|
      bus_people += array[0]
      bus_people -= array[1] 
    end
    raise "Impossible! More people were dropped than there were in the bus!!" if bus_people < 0
    bus_people

  end
end
