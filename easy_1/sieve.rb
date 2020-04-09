require 'pry'

class Sieve
  def initialize(limit)
    @integers = (2..limit).to_a
  end

  # def primes
  #   integers = (2..@limit).to_a
  #   integers.each_index do |index|
  #     integers.each do |number|
  #       prime = integers[index]
  #
  #       if number % prime == 0
  #         integers.delete(number) unless prime == number
  #       end
  #     end
  #   end
  #   integers
  # end

  def primes
    @integers.each do |prime|
      @integers.each do |number|
        @integers.delete(number) if prime != number && number % prime == 0
      end
    end
    @integers
  end
end
