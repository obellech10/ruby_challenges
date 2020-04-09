require 'pry'

class Series
  def initialize(digit_string)
    @digit_array = digit_string.each_char.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError.new("Slice is longer than input.") if length > @digit_array.size
    @digit_array.each_cons(length).to_a
    # result = []
    # @digit_array.each_index do |index|
    #   break if index + length > @digit_array.size
    #   result << @digit_array.slice(index, length)
    # end
    # result
  end
end
