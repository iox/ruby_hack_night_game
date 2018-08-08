require 'sudoku'

describe Sudoku do

  context '#is_valid' do
    it 'returns false for a nil board' do
      expect(Sudoku.new(nil).is_valid).to eq false
    end

    it 'returns true for valid 4x4 board' do
      valid_board = [
        [1,4, 2,3],
        [3,2, 4,1],
        [4,1, 3,2],
        [2,3, 1,4]
      ]
      expect(Sudoku.new(valid_board).is_valid).to eq true
    end

    it 'returns true for valid 9x9 board' do
      valid_board = [
        [5, 3, 4, 6, 7, 8, 9, 1, 2],
        [6, 7, 2, 1, 9, 5, 3, 4, 8],
        [1, 9, 8, 3, 4, 2, 5, 6, 7],
        [8, 5, 9, 7, 6, 1, 4, 2, 3],
        [4, 2, 6, 8, 5, 3, 7, 9, 1],
        [7, 1, 3, 9, 2, 4, 8, 5, 6],
        [9, 6, 1, 5, 3, 7, 2, 8, 4],
        [2, 8, 7, 4, 1, 9, 6, 3, 5],
        [3, 4, 5, 2, 8, 6, 1, 7, 9]
      ]
      expect(Sudoku.new(valid_board).is_valid).to eq true
    end

    it 'returns false for invalid 4x4 board' do
      invalid_board = [
        [1,2,3,4,5],
        [1,2,3,4],
        [1,2,3,4],
        [1]
      ]
      expect(Sudoku.new(invalid_board).is_valid).to eq false
    end

    it 'returns false for invalid 9x9 board' do
      invalid_board = [
        [5, 3, 4, 6, 7, 8, 9, 1, 2],
        [6, 7, 2, 1, 9, 0, 3, 4, 8],
        [1, 0, 0, 3, 4, 2, 5, 6, 0],
        [8, 5, 9, 7, 6, 1, 0, 2, 0],
        [4, 2, 6, 8, 5, 3, 7, 9, 1],
        [7, 1, 3, 9, 2, 4, 8, 5, 6],
        [9, 0, 1, 5, 3, 7, 2, 1, 4],
        [2, 8, 7, 4, 1, 9, 6, 3, 5],
        [3, 0, 0, 4, 8, 1, 1, 7, 9]
      ]
      expect(Sudoku.new(invalid_board).is_valid).to eq false
    end

    it 'returns false for board with inconsistent dimensions' do
      invalid_board = [
        [1, 4, 4, 3, 4],
        [3, 2, 4, 1],
        [4, 1, 3, 3],
        [2, 0, 1, 4],
        [1, 2, 3, 4]
      ]
      expect(Sudoku.new(invalid_board).is_valid).to eq false
    end
  end

end