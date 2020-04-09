require 'pry'

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(number)
    default_multiples = [3, 5]
    calculate_multiples(number, default_multiples)
  end

  def to(number)
    self.class.calculate_multiples(number, @multiples)
  end

  private

  def self.calculate_multiples(number, multiples)
    result = []
    1.upto(number - 1) do |i|
      multiples.each { |multiple| result << i if i % multiple == 0 }
    end
    result.uniq.sum
  end
end
