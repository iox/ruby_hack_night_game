=begin
Create a program, which, given a valid sequence of rolls for one line of American Ten-Pin Bowling, produces the total score for the game.
=end

require "bowling"


describe Bowling do
  it 'correctly calculates an all-zeros game' do
    game = Bowling.new

    9.times do
      game.roll(0)
      game.roll(0)
    end

    game.roll(0)
    game.roll(0)
    expect(game.score).to eq 0
  end

  it 'correctly calculates an all-ones game' do
    game = Bowling.new

    9.times do
      game.roll(1)
      game.roll(1)
    end

    game.roll(1)
    game.roll(1)
    expect(game.score).to eq (20)
  end

  it 'correctly calculates one spare' do
    game = Bowling.new
    game.roll(3)
    game.roll(7)
    game.roll(6)
    expect(game.score).to eq ((3 + 7 + 6) + (6))
  end

  it 'correctly calculates one strike' do
    game = Bowling.new
    game.roll(10)
    game.roll(7)
    game.roll(1)
    expect(game.score).to eq ((10 + 7 + 1) + (7 + 1))
  end

  it 'correctly calculates a perfect game' do
    game = Bowling.new

    9.times do
      game.roll(10)
    end

    game.roll(10)
    game.roll(10)
    game.roll(10)
    expect(game.score).to eq (300)
  end

  it 'correctly calculates a game of spares' do
    game = Bowling.new

    9.times do
      game.roll(6)
      game.roll(4)
    end

    game.roll(6)
    game.roll(4)
    game.roll(6)
    expect(game.score).to eq(160)
  end
end
