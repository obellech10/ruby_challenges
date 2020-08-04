require 'pry'

class Octal
  POWER = 8
  INVALID_STRING = /[8-9\D]/

  def initialize(string)
    @string_array = string.split("")
  end

  def to_decimal
    return 0 unless valid_input?

    @string_array.reverse.map.with_index do |number, idx|
      number.to_i * (POWER ** idx)
    end.sum
  end

  def valid_input?
    @string_array.none? {|item| item.match?(INVALID_STRING) }
  end
end


=begin
  - input is a string object that represents a number, invalid input should return
  0.
  - output is a integer representing the conversion of the input number to
  octal 8.

  implicit requirement:
  1. invalid input consists of any letter or number equal to or higher than 8

  data struture:
  1. create array to hold splited input values.

  algorithm:
  1. validate if input is valid, if not return 0
  2. take input and split and return to an array
  3. iterate over array collection in reverse order. multiplying each array element
  by 8^n-1, where n will be the index value.
  4. return the sum of the array
=end
