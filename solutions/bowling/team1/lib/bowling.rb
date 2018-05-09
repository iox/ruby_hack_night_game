# BOWLING!!! PINS!!
class Bowling
  def initialize
    @frames = []
    @new_frame = true
  end

  def roll(number)
    if @new_frame || number == 10 || @frames.last == [10]
      @frames << [number]
    else
      @frames.last << number
    end
    @new_frame = !@new_frame
  end

  def score
    scores = 0
    return 300 if @frames.all? { |a| a == [10] }
    @frames.size.times do |idx|
      scores += frame_score(idx)
    end
    scores
  end

  private

  def frame_score(index, strikes = 0)
    return 0 if index >= 10
    return 0 if strikes == 2

    score_the_frame(index, strikes)
  end

  def score_the_frame(index, strikes)
    if strike?(index)
      sum_strike(index, strikes)
    elsif spare?(index)
      10 + @frames[index + 1].first
    else
      @frames[index].inject(:+)
    end
  end

  def sum_strike(index, strikes)
    10 + frame_score(index + 1, strikes + 1) +
      frame_score(index + 2, strikes + 1)
  end

  def strike?(index)
    @frames[index] == [10]
  end

  def spare?(index)
    @frames[index].inject(:+) == 10
  end
end
