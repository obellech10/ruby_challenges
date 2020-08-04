require 'pry'

class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def self.to(ceiling)
    default_factors = [3,5]
    new(*default_factors).multiples(ceiling)
  end

  def to(ceiling)
    multiples(ceiling)
  end

  def multiples(ceiling)
    multiples = []
    @factors.each do |factor|
      1.upto(ceiling).each do |number|
        next if number == ceiling
        multiples << number if number % factor == 0
      end
    end
    multiples.uniq.sum
  end

end

=begin
  two different methods are needed for class, class & instance
  #to class method
    - input is an integer that represents the ceiling when calculating multiples, it
    is not to be included in the total sum.
    the class method does not take any other arguments, so the default for the set
    of numbers is 3, 5
    - output is an integer representing the sum of all multiples

    implicit requirement:
    1. if a number is a multiple of both 3 and 5. It should only be included
    once in the sum. Any multiple is only to be included once.
    2. the upto number is not included in the sum of multiples

    data struture:
    1. array to hold the multiples of the given numbers
    2. array to hold the numbers were using to calculate multiples

    algorithm
    1. iterate over collection of numbers to use to calculate multiples
    2. for each number, calculate it's multiples and store them in the multiples
    array if less than input value used as ceiling
    3. remove duplicate values from the multiples array
    4. return the sum of the multiples array
=end
