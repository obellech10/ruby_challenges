require 'pry'

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0

    aliqout = calc_divisors(number).sum
    category(aliqout, number)
  end

  def self.calc_divisors(number)
    (1...number).select { |divisor| number % divisor == 0 }
  end

  def self.category(aliqout, number)
    case
      when aliqout < number then 'deficient'
      when aliqout == number then 'perfect'
      when aliqout > number then 'abundant'
    end
  end
end

=begin
  - the method needed is a class method.
  - input: an integer
  - output: string that returns whether the given integer is perfect or
  deficient/abundant

  implicit requirements
  1. raise RuntimeError if input is less than 0

  data structure
  1. array to hold the divisors of the input

  algorithm
  1. create local variable divisors and set equal to empty array
  2. take input and calculate it's divisors and store them in divisors array
  3. sum array and use total to determine if input number is perfect,deficient or
  abundant
  4. return result of step 3
=end
