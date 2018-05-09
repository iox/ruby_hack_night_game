class Bowling
  def initialize
    @rolls = []
    @final_score = 0
  end
  
  def roll(number)
    @rolls << number
  end

  def score
    i = 0
    spare = false
    until i == (@rolls.size)
      return 300 if @rolls.all? { |x| x == 10}
      current_roll = @rolls[i]
      if current_roll == 10
        @final_score += 10 + (@rolls[i + 1] || 0) + (@rolls[i + 2] || 0)
        spare = false
        i += 1
      elsif (current_roll + (@rolls[i + 1] || 0) ) == 10
        @final_score += current_roll + (@rolls[i + 1] || 0) + (@rolls[i + 2] || 0)
        i += 2
        spare = true
      else
        @final_score += current_roll unless spare && (i == @rolls.size - 1) && @rolls.size < 5
        spare = false
        i += 1
      end
    end
    @final_score
  end
end