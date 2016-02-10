require 'test_helper'
require 'minitest/autorun'


class KingTest < MiniTest::Unit::TestCase

  describe '#valid_moves' do

    it 'should return 3 moves for the top left corner' do 
      king = King.new(x_position: 0, y_position: 0)
      assert_equal [[1,0], [1,1], [0,1]].sort, king.valid_moves.sort
    end

    it 'should return 8 moves from the middle of the board' do
      king = King.new(x_position: 4, y_position: 4)
      assert_equal [[3,3], [3,4], [3,5], 
                    [4,3],        [4,5], 
                    [5,3], [5,4], [5,5]].sort, king.valid_moves.sort

    end

  end
  
end