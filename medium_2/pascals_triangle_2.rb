require 'pry'

# class Triangle
#   def initialize(size)
#     @size = size
#   end
#
#   def rows
#     results = [[1]]
#     @size.times do |i|
#       results.each_cons(2) do |a,b|
#       end
#       binding.pry
#     end
#   end
# end

class Triangle
  attr_reader :rows

  def initialize height
    @rows = (1..height).map { next_row }
    binding.pry
  end

  private

  def next_row
    binding.pry
    bottom_row = @previous_row ? [0, *@previous_row, 0] : [0, 1]
    @previous_row = bottom_row.each_cons(2).map do |left, right|
      binding.pry
      left + right
    end
    # binding.pry
  end
end

=begin
  create a program that computes pascals triangle up to the given amount of rows
  Input: integer representing the size of the triangle
  Output: An array, with each element representing a row of pascals triangle

  - Each triangle starts with the number one at the top.
  - Each row is calculated taking the number to the right and left of it's
  current position in the previous role.

  Data Strcuture
  1. Array to hold the number values of each row

  Algorithm
  1. create an array, results, and set it equal to an empty array
  2. use the size instance variable to determine how many times to run through
  the calculation for determing the rows
  3. if the array index
=end
