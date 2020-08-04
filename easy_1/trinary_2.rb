require 'pry'

class Trinary
  POWER = 3
  INVALID_STRING = /[4-9\D]/

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
