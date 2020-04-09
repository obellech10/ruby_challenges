require 'pry'

class Trinary
  TRINARY_BASE = 3
  def initialize(string)
    @string_array = string.chars
  end

  def to_decimal
    return 0 if @string_array.any?(/[^0-2]/)
    result = 0
    @string_array.reverse_each.with_index do |item, index|
      result += item.to_i * (TRINARY_BASE ** index)
    end
    result
  end
end
