require 'pry'

class Octal
  DECIMAL_BASE = 8

  def initialize(octal_value)
    @array = octal_value.chars
  end

  def to_decimal
    return 0 if check_invalid?(@array)
    decimal = 0
    @array.reverse_each.with_index do |item, index|
      decimal += item.to_i * (DECIMAL_BASE ** index)
    end
    decimal
  end

  def check_invalid?(array)
    array.any?(/[A-Za-z8-9]/)
  end
end
