system 'clear'
require 'pry'

class Numeric
  ROMAN_NUMERALS_RULES = {
    1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
    90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX', 5 => 'V',
    4 => 'IV', 1 => 'I'
  }

  def to_roman
    roman_numeral = ''
    number = self
    ROMAN_NUMERALS_RULES.each do |key, value|
      num_roman_letters, number = number.divmod(key)
      roman_numeral << value * num_roman_letters
    end
    roman_numeral
  end
end
