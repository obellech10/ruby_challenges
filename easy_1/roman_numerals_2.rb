require 'pry'

class Integer
  ROMAN_NUMERALS = {
    1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C', 90 => 'XC',
    50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I'
  }

  def to_roman
    numerals = ''
    number = self
    ROMAN_NUMERALS.each do |arabic, roman_numeral|
      num_roman_numerals, number = number.divmod(arabic)
      numerals << roman_numeral * num_roman_numerals
    end
    numerals
  end
end

=begin
  - Need to create a instance method for the integer class that converts arabic
  numbers to roman numerals

  Input: the method is being called on an integer, which is to be converted
  Output: a string representing the roman numeral equivilant of the caller of the
  method

  Explicit Requirements:
  1.Roman numerals are written by taking the left most digit and working right to
  convert each number. Skipping zeroes.

  Data Structure:
  - Hash that contains a number as a key and the roman numeral as the value.
  - local variable assigned to an empty that will hold the output of the method

  Algorithm:
  1. Create local variable, numerals, and assign it an empty string.
  2. Take the calling object, an integer, iterate through the the keys of the
  Roman Numeral hash, if the remainder of dividing by the key is equal to zero, add
  the value of that key, which will be the roman numeral to the numerals variable
  3. Return the variable numerals
=end
