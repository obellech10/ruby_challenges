require 'pry'

# Competed in 60 minutes. Not including refactoring.
class Prime
  def self.nth(nth_prime)
    raise ArgumentError if nth_prime == 0

    primes = []
    number = 2
    loop do
      primes << number if self.factor_count(number) == 1
      number += 1

      break if primes.size == nth_prime
    end
    primes.fetch(nth_prime - 1)
  end

  def self.factor_count(number)
    max_factor = Integer.sqrt(number)
    count = 0

    1.upto max_factor do |factor|
      if number % factor == 0
        count += 1
      end

      break if count > 1
    end
    count
  end

end

# Launch School student solution
class Prime
  def self.nth(n)
    fail ArgumentError if n < 1
    primes = [2]
    current_test = 3
    until primes.size == n
      primes << current_test if prime?(current_test)
      current_test += 2
    end
    primes.last
  end

  def self.prime?(number)
    (2..Math.sqrt(number)).each do |test|
      return false if number % test == 0
    end
    true
  end
end



=begin
  input: integer representing the nth prime number
  output: the prime number at the nth postion

  1. Creat an array to store the prime numbers
  2. starting at 1, determine if number is prime by dividing it by each number
  smaller than it square root value.
  3. if number has more than one factor, stop iterating through it's possible
  factors and move to the next number
  4. If a number only has one factor, push it to the prime array
  5. Once the prime array size equals the nth_prime - 1, return the last integer
  added to the array

=end
