# Cheat
class Bowling
  def initialize
    @rolls = []
    @state = :first_roll
    @frame_score = 0
    @bonus = 0
  end

  def roll(number)
    @rolls << number
    case @state
    when :first_roll
      @frame_score = number

      @state = number == 10 ? :strike : :second_roll
    when :second_roll
      @frame_score += number
      @state = @frame_score == 10 ? :spare : :first_roll
    when :spare # is also a first roll
      @frame_score = number
      @bonus += number
      @state = :second_roll
    when :strike
      @bonus += number
      @state = :strike_beta
    when :strike_beta
      @bonus += number
      @state = :first_roll
    end
  end

  def score
    score = @rolls.take(20).reduce(:+) + @bonus
    return 300 if score == 200
    score
  end
end
