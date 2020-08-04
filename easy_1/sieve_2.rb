require 'pry'

class Sieve
  def initialize(limit)
    @numbers = (2..limit).to_a
  end

  def primes
    @numbers.each do |denominator|
      @numbers.each do |num|
        next if num == denominator
        @numbers.delete(num) if num % denominator == 0
      end
    end
    @numbers
  end
end
