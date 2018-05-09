# dsadasdas
class BusPeople
  def self.calculate(input)
    get_on, get_off = 0, 0
    input.each do |stop|
      get_on +=  stop[0]
      get_off += stop[1]
    end
    left_on = get_on - get_off
    if left_on < 0
      raise "Impossible! More people were dropped than there were in the bus!!"
    else
      left_on
    end
  end
end
