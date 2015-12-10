require 'minitest/autorun'


module Luhn
  def self.is_valid?(number)

  
    #IMPLEMENT ME

    #Step 1 - break the credit card into it's individual digits.

    var = number.to_s.split('').map(&:to_i)

    

    #Step 2 - Start from the right, double every second digit (i.e digit 2, 4, 6 etc.)

    var2 = var.reverse

   

    reversed_transformed = []

    var2.each_with_index do |digit, position| 
      if position % 2 == 0
         reversed_transformed << digit
      else 
        reversed_transformed << (digit * 2)
      end
    end

     puts reversed_transformed.inspect

    #Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
    #Step 4 - Sum the digits.
    #Step 5 - If the sum is divisible by 10 it's a valid number. Otherwise it's invalid

  end

end

class TestLuhn < MiniTest::Unit::TestCase

  def test_luhn_valid
    assert Luhn.is_valid?(4194560385008504)
  end

  #def test_luhn_invalid
   # assert ! Luhn.is_valid?(4194560385008505)
  #end

  #def test_luhn_valid2
    #assert Luhn.is_valid?(377681478627336), "Check step two: Did you start at the right?"
  #end

  #def test_luhn_invalid2
    #assert ! Luhn.is_valid?(377681478627337), "Check step two: Did you start at the right?"
  #end

  

end